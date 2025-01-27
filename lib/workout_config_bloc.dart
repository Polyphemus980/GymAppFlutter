import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/models/set_data.dart';
import 'package:gym_app/data/models/user_workout_plans.dart';
import 'package:gym_app/data/repositories/local_workout_repository.dart';

import 'data/models/workout_config_set.dart';

abstract class WorkoutConfigEvent {}

class ValidationFailedEvent extends WorkoutConfigEvent {
  String error;

  ValidationFailedEvent({required this.error});
}

class ValidationSucceededEvent extends WorkoutConfigEvent {
  final List<SetData> sets;
  final String? plannedWorkoutId;
  ValidationSucceededEvent({required this.sets, this.plannedWorkoutId});
}

class FinishConfigurationEvent extends WorkoutConfigEvent {
  bool isRpe;

  FinishConfigurationEvent({required this.isRpe});
}

class FetchDataEvent extends WorkoutConfigEvent {
  final UserWorkoutPlans? workoutPlan;
  final List<SetData>? data;
  FetchDataEvent({this.workoutPlan, this.data});
}

class UpdateExercisesEvent extends WorkoutConfigEvent {
  List<Exercise> exercises;

  UpdateExercisesEvent({required this.exercises});
}

class UpdateSetEvent extends WorkoutConfigEvent {
  final int index;
  final List<WorkoutConfigSet> sets;

  UpdateSetEvent(this.index, this.sets);
}

class ReorderExercisesEvent extends WorkoutConfigEvent {
  final int oldIndex;
  final int newIndex;

  ReorderExercisesEvent(this.oldIndex, this.newIndex);
}

abstract class WorkoutConfigState {}

class Loading extends WorkoutConfigState {}

class Loaded extends WorkoutConfigState {
  final List<SetData> sets;
  final List<Exercise> exercises;
  final String? plannedWorkoutId;
  Loaded({required this.sets, required this.exercises, this.plannedWorkoutId});
}

class Error extends WorkoutConfigState {
  final String error;

  Error(this.error);
}

class WorkoutConfigBloc extends Bloc<WorkoutConfigEvent, WorkoutConfigState>
    with BlocPresentationMixin<WorkoutConfigState, WorkoutConfigEvent> {
  final LocalWorkoutRepository workoutRepository;

  WorkoutConfigBloc({required this.workoutRepository}) : super(Loading()) {
    on<ReorderExercisesEvent>(_reorderExercises);
    on<UpdateSetEvent>(_updateSets);
    on<FetchDataEvent>(_fetchWorkoutData);
    on<UpdateExercisesEvent>(_updateExercises);
    on<FinishConfigurationEvent>(_finishConfiguration);
  }

  _updateExercises(
      UpdateExercisesEvent event, Emitter<WorkoutConfigState> emit) {
    if (state is! Loaded) {
      return;
    }
    final loadedState = state as Loaded;
    final sets = List<SetData>.from(loadedState.sets);
    for (int i = sets.length; i < event.exercises.length; i++) {
      sets.add(SetData(exercise: event.exercises[i], sets: []));
    }
    emit(Loaded(sets: sets, exercises: event.exercises));
  }

  _reorderExercises(
      ReorderExercisesEvent event, Emitter<WorkoutConfigState> emit) {
    if (state is! Loaded) {
      return;
    }
    final loadedState = state as Loaded;
    final exercises = List<Exercise>.from(loadedState.exercises);
    final sets = List<SetData>.from(loadedState.sets);
    int oldIndex = event.oldIndex;
    int newIndex = event.newIndex;
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final tempExercise = exercises.removeAt(oldIndex);
    exercises.insert(newIndex, tempExercise);

    if (sets.length > oldIndex) {
      final tempSet = sets.removeAt(oldIndex);
      if (newIndex < sets.length) {
        sets.insert(newIndex, tempSet);
      } else {
        sets.add(tempSet);
      }
    }
    emit(Loaded(sets: sets, exercises: exercises));
  }

  _updateSets(UpdateSetEvent event, Emitter<WorkoutConfigState> emit) {
    if (state is! Loaded) {
      return;
    }
    final loadedState = state as Loaded;
    final sets = loadedState.sets;
    int i = sets.length;
    while (sets.length <= event.index) {
      sets.add(SetData(exercise: loadedState.exercises[i], sets: []));
      i++;
    }
    sets[event.index] = sets[event.index].copyWith(sets: event.sets);
    emit(Loaded(sets: sets, exercises: loadedState.exercises));
  }

  _fetchWorkoutData(
      FetchDataEvent event, Emitter<WorkoutConfigState> emit) async {
    if (event.data == null && event.workoutPlan == null) {
      emit(Loaded(exercises: [], sets: []));
    } else if (event.workoutPlan != null) {
      emit(Loading());
      final workout =
          await workoutRepository.getPlannedWorkout(event.workoutPlan!);
      final setData = workout.exercises!
          .map((exercise) => SetData(
              exercise: exercise.exercise!,
              sets: exercise.sets!
                  .map((set) => WorkoutConfigSet.fromPlannedSet(set))
                  .toList()))
          .toList();
      final exercises =
          workout.exercises!.map((exercise) => exercise.exercise!).toList();
      emit(Loaded(
          sets: setData, exercises: exercises, plannedWorkoutId: workout.id));
    } else {
      emit(Loaded(
          sets: event.data!,
          exercises: event.data!.map((set) => set.exercise).toList()));
    }
  }

  _finishConfiguration(
      FinishConfigurationEvent event, Emitter<WorkoutConfigState> emit) {
    if (state is! Loaded) {
      return;
    }
    final loadedState = state as Loaded;
    final allSetsHaveData = _validateAllSets(loadedState.sets);
    final isRpeValid = _validateRpe(loadedState.sets);
    final isRepRangeValid = _validateRepRange(loadedState.sets);
    final hasAtLeastOneExercise = _validateExercises(loadedState.exercises);

    if (hasAtLeastOneExercise &&
        allSetsHaveData &&
        (!event.isRpe || (isRpeValid && isRepRangeValid))) {
      _adjustSetIndices(loadedState.sets);
      emitPresentation(ValidationSucceededEvent(
          sets: loadedState.sets,
          plannedWorkoutId: loadedState.plannedWorkoutId));
    } else {
      emitPresentation(ValidationFailedEvent(
          error: _getValidationErrorMessage(hasAtLeastOneExercise,
              allSetsHaveData, isRpeValid, isRepRangeValid)));
    }
  }

  bool _validateRpe(List<SetData> sets) {
    return sets
        .every((exercise) => exercise.sets.every((set) => set.rpe != null));
  }

  bool _validateRepRange(List<SetData> sets) {
    return sets.every((exercise) => exercise.sets.every((set) =>
        set.maxRepetitions != null &&
        set.minRepetitions != null &&
        set.minRepetitions! <= set.maxRepetitions!));
  }

  bool _validateExercises(List<Exercise> exercises) {
    return exercises.isNotEmpty;
  }

  bool _validateAllSets(List<SetData> sets) {
    return sets.isNotEmpty && sets.every((set) => set.sets.isNotEmpty);
  }

  String _getValidationErrorMessage(
      bool hasExercises, bool hasSets, bool rpeValid, bool repRangeValid) {
    if (!hasExercises) {
      return "Must choose at least one exercise";
    }
    if (!hasSets) {
      return "Each chosen exercise must have at least one set";
    }
    if (!rpeValid) {
      return "Each set must have RPE filled in";
    }
    if (!repRangeValid) {
      return "Each set must have min and max reps filled in correctly";
    }
    return "Unknown validation error";
  }

  _adjustSetIndices(List<SetData> sets) {
    for (int i = 0; i < sets.length; i++) {
      for (int j = 0; j < sets[i].sets.length; j++) {
        sets[i].sets[j].setNumber = j;
      }
    }
  }
}
