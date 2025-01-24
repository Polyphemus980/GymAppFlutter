import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/data/repositories/sync_workout_repository.dart';

import 'data/models/set_data.dart';
import 'data/models/workout_plan_helpers.dart';

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

class FinishCreationEvent extends NewWorkoutPlanEvent {
  final String userId;
  final bool isOnline;
  FinishCreationEvent({required this.userId, required this.isOnline});
}

sealed class NewWorkoutPlanState {}

class InitialState extends NewWorkoutPlanState {}

class InProgressState extends NewWorkoutPlanState {
  WorkoutPlanHelper plan;
  InProgressState({required this.plan});
}

class EndedState extends NewWorkoutPlanState {}

class NewWorkoutPlanBloc
    extends Bloc<NewWorkoutPlanEvent, NewWorkoutPlanState> {
  final SyncWorkoutRepository syncWorkoutRepository;
  NewWorkoutPlanBloc({required this.syncWorkoutRepository})
      : super(InitialState()) {
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
    final workoutPlan = WorkoutPlanHelper.empty(
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
      FinishCreationEvent event, Emitter<NewWorkoutPlanState> emit) async {
    final currentState = state as InProgressState;
    final plan = currentState.plan;
    debugPrint("Here ${event.isOnline.toString()}");
    await syncWorkoutRepository.addWorkoutPlanSyncSplit(
        plan, event.userId, event.isOnline);
    emit(EndedState());
  }
}
