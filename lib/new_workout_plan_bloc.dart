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

  WorkoutWeek.empty(int numberOfDays)
      : days = List.generate(
          numberOfDays,
          (_) => WorkoutDay(),
        );
}

class WorkoutPlan {
  List<WorkoutWeek> weeks;

  WorkoutPlan.empty({
    required int numberOfWeeks,
    required int daysPerWeek,
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

  WorkoutPlan({required this.weeks});

  WorkoutPlan copyWith({int? weekIndex, int? dayIndex, WorkoutDay? day}) {
    final updatedWeeks = List<WorkoutWeek>.from(weeks);
    if (weekIndex != null && dayIndex != null && day != null) {
      updatedWeeks[weekIndex] = weeks[weekIndex].copyWith(
        index: dayIndex,
        day: day,
      );
    }
    return WorkoutPlan(weeks: updatedWeeks);
  }

  int get length => weeks.length;
}

sealed class NewWorkoutPlanEvent {}

class InitializePlanEvent extends NewWorkoutPlanEvent {
  final int numWeeks;
  final int numDays;

  InitializePlanEvent({required this.numDays, required this.numWeeks});
}

class ChangedDayEvent extends NewWorkoutPlanEvent {
  final List<SetData> sets;
  final int weekIndex;
  final int dayIndex;

  ChangedDayEvent(
      {required this.sets, required this.weekIndex, required this.dayIndex});
}

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
        numberOfWeeks: event.numWeeks, daysPerWeek: event.numDays);
    emit(InProgressState(plan: workoutPlan));
  }
}
