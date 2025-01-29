import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/data/repositories/workout/sync_workout_repository.dart';

import '../../../core/domain/sets/set_data.dart';
import '../../../core/domain/workouts/workout_plan_helpers.dart';

sealed class NewWorkoutPlanEvent {}

class InitializePlanEvent extends NewWorkoutPlanEvent {
  InitializePlanEvent({
    required this.name,
    required this.description,
    required this.numDays,
    required this.numWeeks,
  });
  final int numWeeks;
  final int numDays;
  final String name;
  final String description;
}

class CopyWeekEvent extends NewWorkoutPlanEvent {
  CopyWeekEvent({required this.fromIndex, required this.toIndices});
  final int fromIndex;
  final List<int> toIndices;
}

class ChangedDayEvent extends NewWorkoutPlanEvent {
  ChangedDayEvent({
    required this.sets,
    required this.weekIndex,
    required this.dayIndex,
  });
  final List<SetData> sets;
  final int weekIndex;
  final int dayIndex;
}

class FinishCreationEvent extends NewWorkoutPlanEvent {
  FinishCreationEvent({required this.userId, required this.isOnline});
  final String userId;
  final bool isOnline;
}

sealed class NewWorkoutPlanState {}

class InitialState extends NewWorkoutPlanState {}

class InProgressState extends NewWorkoutPlanState {
  InProgressState({required this.plan});
  WorkoutPlanHelper plan;
}

class EndedState extends NewWorkoutPlanState {}

class NewWorkoutPlanBloc
    extends Bloc<NewWorkoutPlanEvent, NewWorkoutPlanState> {
  NewWorkoutPlanBloc({required this.syncWorkoutRepository})
      : super(InitialState()) {
    on<ChangedDayEvent>(_changeDay);
    on<InitializePlanEvent>(_initializePlan);
    on<CopyWeekEvent>(_copyWeeks);
    on<FinishCreationEvent>(_finishCreation);
  }
  final SyncWorkoutRepository syncWorkoutRepository;

  void _changeDay(ChangedDayEvent event, Emitter<NewWorkoutPlanState> emit) {
    final currentState = state as InProgressState;
    final newWorkoutPlan = currentState.plan.copyWith(
      weekIndex: event.weekIndex,
      dayIndex: event.dayIndex,
      day: WorkoutDay(sets: event.sets),
    );
    emit(InProgressState(plan: newWorkoutPlan));
  }

  void _initializePlan(
    InitializePlanEvent event,
    Emitter<NewWorkoutPlanState> emit,
  ) {
    final workoutPlan = WorkoutPlanHelper.empty(
      numberOfWeeks: event.numWeeks,
      daysPerWeek: event.numDays,
      name: event.name,
      description: event.description,
    );
    emit(InProgressState(plan: workoutPlan));
  }

  void _copyWeeks(CopyWeekEvent event, Emitter<NewWorkoutPlanState> emit) {
    final currentState = state as InProgressState;
    final newPlan =
        currentState.plan.copyWeeks(event.fromIndex, event.toIndices);
    emit(InProgressState(plan: newPlan));
  }

  Future<void> _finishCreation(
    FinishCreationEvent event,
    Emitter<NewWorkoutPlanState> emit,
  ) async {
    final currentState = state as InProgressState;
    final plan = currentState.plan;
    await syncWorkoutRepository.addWorkoutPlanSyncSplit(
      plan,
      event.userId,
      event.isOnline,
    );
    emit(EndedState());
  }
}
