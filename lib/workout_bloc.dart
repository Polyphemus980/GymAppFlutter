import 'package:flutter/cupertino.dart';
import 'package:gym_app/data/models/set_data.dart';
import 'package:gym_app/data/models/workout_config_set.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

sealed class WorkoutEvent {}

class InitializeSetsEvent extends WorkoutEvent {
  final List<SetData> sets;

  InitializeSetsEvent({required this.sets});
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

  CompleteSetEvent({required this.exerciseIndex});
}

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

sealed class WorkoutState {}

class InitialState extends WorkoutState {}

class WorkoutInProgress extends WorkoutState {
  final List<SetData> sets;
  WorkoutInProgress({
    required this.sets,
  });

  Map<String, dynamic> toJson() {
    return {'data': sets.map((set) => set.toJson()).toList()};
  }

  factory WorkoutInProgress.fromJson(Map<String, dynamic> json) {
    return WorkoutInProgress(
      sets: (json['data'] as List)
          .map((set) => SetData.fromJson(set as Map<String, dynamic>))
          .toList(),
    );
  }
}

class WorkoutEnded extends WorkoutState {}

class WorkoutBloc extends HydratedBloc<WorkoutEvent, WorkoutState> {
  final PageController _pageController;
  WorkoutBloc(this._pageController) : super(InitialState()) {
    on<InitializeSetsEvent>(_initializeSets);
    on<AddSetEvent>(_addSet);
    on<RemoveSetEvent>(_removeSet);
    on<CompleteSetEvent>(_completeSet);
    on<EditSetEvent>(_editSet);
  }

  _initializeSets(InitializeSetsEvent event, Emitter<WorkoutState> emit) {
    if (state is WorkoutInProgress &&
        (state as WorkoutInProgress).sets.isNotEmpty) {
      return;
    }

    emit(WorkoutInProgress(sets: event.sets));
  }

  _addSet(AddSetEvent event, Emitter<WorkoutState> emit) {
    if (state is WorkoutInProgress) {
      final sets = List<SetData>.from((state as WorkoutInProgress).sets);
      sets[event.exerciseIndex].sets.add(WorkoutConfigSet(
          exerciseId: sets[event.exerciseIndex].exercise.id,
          setNumber: sets[event.exerciseIndex].sets.length));
      emit(WorkoutInProgress(sets: sets));
    }
  }

  _removeSet(RemoveSetEvent event, Emitter<WorkoutState> emit) {
    if (state is WorkoutInProgress) {
      final sets = List<SetData>.from((state as WorkoutInProgress).sets);
      if (sets[event.exerciseIndex].sets.isEmpty) {
        return;
      }
      sets[event.exerciseIndex].sets.removeLast();
      emit(WorkoutInProgress(sets: sets));
    }
  }

  _editSet(EditSetEvent event, Emitter<WorkoutState> emit) {
    final currentState = state as WorkoutInProgress;
    final setDatas = List<SetData>.from((currentState).sets);
    setDatas[event.exerciseIndex].sets[event.setIndex] =
        setDatas[event.exerciseIndex]
            .sets[event.setIndex]
            .copyWith(weight: event.weight, repetitions: event.reps);
    emit(WorkoutInProgress(sets: setDatas));
  }

  _completeSet(CompleteSetEvent event, Emitter<WorkoutState> emit) {
    if (state is! WorkoutInProgress) {
      return;
    }
    final currentState = state as WorkoutInProgress;
    final sets = List<SetData>.from((currentState).sets);
    sets[event.exerciseIndex]
        .sets
        .firstWhere((set) => !set.completed)
        .completed = true;
    final shouldMove =
        sets[event.exerciseIndex].sets.every((set) => set.completed);
    if (shouldMove) {
      final nextIndex = sets
          .indexWhere((setData) => setData.sets.any((set) => !set.completed));
      if (nextIndex == -1) {
        emit(WorkoutEnded());
        return;
      }
      _pageController.animateToPage(nextIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
    emit(WorkoutInProgress(sets: sets));
  }

  @override
  WorkoutState? fromJson(Map<String, dynamic> json) {
    final String type = json['type'];
    switch (type) {
      case 'WorkoutInProgress':
        return WorkoutInProgress.fromJson(json['data']);
      case 'WorkoutEnded':
        return WorkoutEnded();
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
    } else if (state is WorkoutEnded) {
      return {
        'type': 'WorkoutEnded',
      };
    }
    return null;
  }
}
