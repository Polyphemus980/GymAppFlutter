import 'dart:ui';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:gym_app/core/domain/sets/set_data.dart';
import 'package:gym_app/core/domain/sets/workout_config_set.dart';
import 'package:gym_app/data/repositories/workout/sync_workout_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'core/dependency_injection/get_it_dependency_injection.dart';

sealed class WorkoutEvent {}

class InitializeSetsEvent extends WorkoutEvent {
  final List<SetData> sets;
  final String userId;
  final String? plannedWorkoutId;
  InitializeSetsEvent({
    required this.sets,
    required this.userId,
    this.plannedWorkoutId,
  });
}

class AddSetEvent extends WorkoutEvent {
  final int exerciseIndex;

  AddSetEvent({required this.exerciseIndex});
}

class RemoveSetEvent extends WorkoutEvent {
  final int exerciseIndex;

  RemoveSetEvent({required this.exerciseIndex});
}

class CompleteSetEvent extends WorkoutEvent {
  final int exerciseIndex;
  final int duration;
  final bool isMetric;
  final VoidCallback onSuccess;
  CompleteSetEvent(
      {required this.exerciseIndex,
      required this.duration,
      required this.isMetric,
      required this.onSuccess});
}

class EndWorkoutEvent extends WorkoutEvent {
  final String? userId;
  final bool isMetric;
  final bool dismissed;

  EndWorkoutEvent(
      {this.userId, this.dismissed = false, required this.isMetric});
}

class EndWorkoutPresentationEvent extends WorkoutEvent {}

class EditSetEvent extends WorkoutEvent {
  final int reps;
  final double weight;
  final int setIndex;
  final int exerciseIndex;
  EditSetEvent(
      {required this.exerciseIndex,
      required this.setIndex,
      required this.reps,
      required this.weight});
}

class ChangePageEvent extends WorkoutEvent {
  final int page;

  ChangePageEvent({required this.page});
}

class IncorrectRepsEvent extends WorkoutEvent {}

sealed class WorkoutState {}

class InitialState extends WorkoutState {}

class WorkoutInProgress extends WorkoutState {
  final List<SetData> sets;
  WorkoutInProgress(
      {required this.userId, required this.sets, this.plannedWorkoutId});
  final String? plannedWorkoutId;
  final String userId;

  Map<String, dynamic> toJson() {
    return {
      'data': sets.map((set) => set.toJson()).toList(),
      'userId': userId,
      'plannedWorkoutId': plannedWorkoutId
    };
  }

  factory WorkoutInProgress.fromJson(Map<String, dynamic> json) {
    return WorkoutInProgress(
      sets: (json['data'] as List)
          .map((set) => SetData.fromJson(set as Map<String, dynamic>))
          .toList(),
      userId: json['userId'],
      plannedWorkoutId: json['plannedWorkoutId'],
    );
  }
}

class WorkoutEnded extends WorkoutState {}

class WorkoutBloc extends HydratedBloc<WorkoutEvent, WorkoutState>
    with BlocPresentationMixin<WorkoutState, WorkoutEvent> {
  final SyncWorkoutRepository workoutRepository;
  WorkoutBloc({required this.workoutRepository}) : super(InitialState()) {
    on<InitializeSetsEvent>(_initializeSets);
    on<AddSetEvent>(_addSet);
    on<RemoveSetEvent>(_removeSet);
    on<CompleteSetEvent>(_completeSet);
    on<EditSetEvent>(_editSet);
    on<EndWorkoutEvent>(_endWorkout);
  }

  _initializeSets(InitializeSetsEvent event, Emitter<WorkoutState> emit) {
    if (state is WorkoutInProgress &&
        (state as WorkoutInProgress).sets.isNotEmpty) {
      return;
    }

    emit(WorkoutInProgress(
        sets: event.sets,
        userId: event.userId,
        plannedWorkoutId: event.plannedWorkoutId));
  }

  _addSet(AddSetEvent event, Emitter<WorkoutState> emit) {
    if (state is WorkoutInProgress) {
      final currentState = state as WorkoutInProgress;
      final sets = List<SetData>.from(currentState.sets);
      sets[event.exerciseIndex].sets.add(
          WorkoutConfigSet(setNumber: sets[event.exerciseIndex].sets.length));
      emit(WorkoutInProgress(
          sets: sets,
          plannedWorkoutId: currentState.plannedWorkoutId,
          userId: currentState.userId));
    }
  }

  _removeSet(RemoveSetEvent event, Emitter<WorkoutState> emit) {
    if (state is WorkoutInProgress) {
      final currentState = state as WorkoutInProgress;
      final sets = List<SetData>.from(currentState.sets);
      if (sets[event.exerciseIndex].sets.isEmpty) {
        return;
      }
      sets[event.exerciseIndex].sets.removeLast();
      emit(WorkoutInProgress(
          sets: sets,
          plannedWorkoutId: currentState.plannedWorkoutId,
          userId: currentState.userId));
    }
  }

  _editSet(EditSetEvent event, Emitter<WorkoutState> emit) {
    final currentState = state as WorkoutInProgress;
    final setDatas = List<SetData>.from((currentState).sets);
    setDatas[event.exerciseIndex].sets[event.setIndex] =
        setDatas[event.exerciseIndex]
            .sets[event.setIndex]
            .copyWith(weight: event.weight, repetitions: event.reps);
    emit(WorkoutInProgress(
        sets: setDatas,
        plannedWorkoutId: currentState.plannedWorkoutId,
        userId: currentState.userId));
  }

  _completeSet(CompleteSetEvent event, Emitter<WorkoutState> emit) {
    if (state is! WorkoutInProgress) {
      return;
    }
    final currentState = state as WorkoutInProgress;
    final sets = List<SetData>.from((currentState).sets);
    var set = sets[event.exerciseIndex]
        .sets
        .where((set) => !set.completed)
        .firstOrNull;

    if (set != null) {
      if (set.repetitions == null || set.repetitions == 0) {
        emitPresentation(IncorrectRepsEvent());
        return;
      }
      set.duration = event.duration;
      set.completed = true;
      event.onSuccess();
    }
    final shouldMove =
        sets[event.exerciseIndex].sets.every((set) => set.completed);
    if (shouldMove) {
      final nextIndex = sets
          .indexWhere((setData) => setData.sets.any((set) => !set.completed));
      if (nextIndex == -1) {
        add(EndWorkoutEvent(isMetric: event.isMetric));
        return;
      }
      emitPresentation(ChangePageEvent(page: nextIndex));
    }
    emit(WorkoutInProgress(
        sets: sets,
        plannedWorkoutId: currentState.plannedWorkoutId,
        userId: currentState.userId));
  }

  _endWorkout(EndWorkoutEvent event, Emitter<WorkoutState> emit) {
    emitPresentation(EndWorkoutPresentationEvent());
    final currentState = state as WorkoutInProgress;
    if (!event.dismissed) {
      workoutRepository.addCompletedWorkoutSplit(
          currentState.sets,
          currentState.userId,
          getIt.isOnline,
          currentState.plannedWorkoutId,
          event.isMetric);
    }
    emit(WorkoutEnded());
    clear();
  }

  @override
  WorkoutState? fromJson(Map<String, dynamic> json) {
    final String type = json['type'];
    switch (type) {
      case 'WorkoutInProgress':
        return WorkoutInProgress.fromJson(json['data']);
      default:
        return InitialState();
    }
  }

  @override
  Map<String, dynamic>? toJson(WorkoutState state) {
    if (state is WorkoutInProgress) {
      return {
        'type': 'WorkoutInProgress',
        'data': state.toJson(),
      };
    }
    return null;
  }
}
