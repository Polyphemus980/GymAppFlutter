import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/models/set_data.dart';

class WorkoutDay {
  final List<SetData> sets;

  WorkoutDay({List<SetData>? sets}) : sets = sets ?? [];

  WorkoutDay copyWith({List<SetData>? sets}) {
    return WorkoutDay(
      sets: sets ?? this.sets,
    );
  }

  WorkoutDay copy() {
    List<SetData> copiedSets = sets.map((set) => set.copy()).toList();
    return WorkoutDay(
      sets: copiedSets, // Create a new list with copied sets
    );
  }
}

class WorkoutWeek {
  final List<WorkoutDay> days;

  WorkoutWeek({required this.days});

  WorkoutWeek copyWith({int? index, WorkoutDay? day}) {
    final updatedDays = List<WorkoutDay>.from(days);
    if (index != null && day != null) {
      updatedDays[index] = day;
    }
    return WorkoutWeek(days: updatedDays);
  }

  WorkoutWeek copy() {
    List<WorkoutDay> copiedDays = days.map((day) => day.copy()).toList();
    return WorkoutWeek(days: copiedDays);
  }

  WorkoutWeek.empty(int numberOfDays)
      : days = List.generate(
          numberOfDays,
          (_) => WorkoutDay(),
        );
}

class WorkoutPlan {
  List<WorkoutWeek> weeks;
  String name;
  String description;
  WorkoutPlan.empty({
    required int numberOfWeeks,
    required int daysPerWeek,
    required this.name,
    required this.description,
  }) : weeks = List.generate(
          numberOfWeeks,
          (_) => WorkoutWeek.empty(daysPerWeek),
        );

  WorkoutWeek getWeek(int weekIndex) {
    return weeks[weekIndex];
  }

  WorkoutDay getDay(int weekIndex, int dayIndex) {
    return weeks[weekIndex].days[dayIndex];
  }

  WorkoutPlan({
    required this.weeks,
    required this.name,
    required this.description,
  });

  WorkoutPlan copyWith({int? weekIndex, int? dayIndex, WorkoutDay? day}) {
    final updatedWeeks = List<WorkoutWeek>.from(weeks);
    if (weekIndex != null && dayIndex != null && day != null) {
      updatedWeeks[weekIndex] = weeks[weekIndex].copyWith(
        index: dayIndex,
        day: day,
      );
    }
    return WorkoutPlan(
        weeks: updatedWeeks, name: name, description: description);
  }

  WorkoutPlan copyWeeks(int fromIndex, List<int> toIndices) {
    final updatedWeeks = List<WorkoutWeek>.from(weeks);
    for (int i = 0; i < toIndices.length; i++) {
      updatedWeeks[toIndices[i]] = updatedWeeks[fromIndex].copy();
    }
    return WorkoutPlan(
        weeks: updatedWeeks, name: name, description: description);
  }

  bool isFilled() {
    return weeks.every((week) => week.days.every((day) => day.sets.isNotEmpty));
  }

  int get length => weeks.length;
}

sealed class NewWorkoutPlanEvent {}

class InitializePlanEvent extends NewWorkoutPlanEvent {
  final int numWeeks;
  final int numDays;
  final String name;
  final String description;

  InitializePlanEvent(
      {required this.name,
      required this.description,
      required this.numDays,
      required this.numWeeks});
}

class CopyWeekEvent extends NewWorkoutPlanEvent {
  final int fromIndex;
  final List<int> toIndices;

  CopyWeekEvent({required this.fromIndex, required this.toIndices});
}

class ChangedDayEvent extends NewWorkoutPlanEvent {
  final List<SetData> sets;
  final int weekIndex;
  final int dayIndex;

  ChangedDayEvent(
      {required this.sets, required this.weekIndex, required this.dayIndex});
}

class FinishCreationEvent extends NewWorkoutPlanEvent {}

sealed class NewWorkoutPlanState {}

class InitialState extends NewWorkoutPlanState {}

class InProgressState extends NewWorkoutPlanState {
  WorkoutPlan plan;
  InProgressState({required this.plan});
}

class NewWorkoutPlanBloc
    extends Bloc<NewWorkoutPlanEvent, NewWorkoutPlanState> {
  NewWorkoutPlanBloc() : super(InitialState()) {
    on<ChangedDayEvent>(_changeDay);
    on<InitializePlanEvent>(_initializePlan);
    on<CopyWeekEvent>(_copyWeeks);
    on<FinishCreationEvent>(_finishCreation);
  }

  _changeDay(ChangedDayEvent event, Emitter<NewWorkoutPlanState> emit) {
    final currentState = state as InProgressState;
    final newWorkoutPlan = currentState.plan.copyWith(
        weekIndex: event.weekIndex,
        dayIndex: event.dayIndex,
        day: WorkoutDay(sets: event.sets));
    emit(InProgressState(plan: newWorkoutPlan));
  }

  _initializePlan(
      InitializePlanEvent event, Emitter<NewWorkoutPlanState> emit) {
    final workoutPlan = WorkoutPlan.empty(
        numberOfWeeks: event.numWeeks,
        daysPerWeek: event.numDays,
        name: event.name,
        description: event.description);
    emit(InProgressState(plan: workoutPlan));
  }

  _copyWeeks(CopyWeekEvent event, Emitter<NewWorkoutPlanState> emit) {
    final currentState = state as InProgressState;
    final newPlan =
        currentState.plan.copyWeeks(event.fromIndex, event.toIndices);
    emit(InProgressState(plan: newPlan));
  }

  _finishCreation(
      FinishCreationEvent event, Emitter<NewWorkoutPlanState> emit) {}
}
