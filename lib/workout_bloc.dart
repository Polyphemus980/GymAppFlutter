import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/data/models/sets.dart';
import 'package:gym_app/screens/empty_workout_screen.dart';

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
  final int currentExerciseIndex;
  final bool shouldMoveToNext;
  WorkoutInProgress({
    required this.sets,
    this.shouldMoveToNext = false,
    this.currentExerciseIndex = 0,
  });
}

class WorkoutEnded extends WorkoutState {}

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final PageController _pageController;
  WorkoutBloc(this._pageController) : super(InitialState()) {
    on<InitializeSetsEvent>(_initializeSets);
    on<AddSetEvent>(_addSet);
    on<RemoveSetEvent>(_removeSet);
    on<CompleteSetEvent>(_completeSet);
    on<EditSetEvent>(_editSet);
  }

  _initializeSets(InitializeSetsEvent event, Emitter<WorkoutState> emit) {
    emit(WorkoutInProgress(sets: event.sets, shouldMoveToNext: false));
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
    final nextIndex =
        sets.indexWhere((setData) => setData.sets.any((set) => !set.completed));
    if (shouldMove) {
      final nextIndex = sets
          .indexWhere((setData) => setData.sets.any((set) => !set.completed));
      if (nextIndex == -1) {
        emit(WorkoutEnded());
        return;
      }
      _pageController.animateToPage(nextIndex,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
    emit(WorkoutInProgress(sets: sets));
  }

  _moveNextPage(int length) {
    if (_pageController.page! < length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  _movePreviousPage() {
    if (_pageController.page! > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
}
