import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/data/models/exercise/exercise.dart';
import 'package:gym_app/data/models/exercise/muscle_group.dart';
import 'package:gym_app/data/repositories/exercise/local_exercise_repository.dart';
import 'package:rxdart/rxdart.dart';

sealed class ExerciseEvent {}

class SearchExerciseEvent extends ExerciseEvent {
  SearchExerciseEvent(this.query);
  final String query;
}

class FilterExerciseEvent extends ExerciseEvent {
  FilterExerciseEvent(this.selectedMuscles);
  final List<MuscleGroup> selectedMuscles;
}

class LoadedExerciseEvent extends ExerciseEvent {
  LoadedExerciseEvent(this.loadedExercises);
  final List<Exercise> loadedExercises;
}

sealed class ExerciseState {}

class ExerciseLoading extends ExerciseState {}

class ExerciseLoaded extends ExerciseState {
  ExerciseLoaded(
      this.loadedExercises, this.query, this.selectedMuscles, this.allMuscles,);
  final List<Exercise> loadedExercises;
  final String query;
  final List<MuscleGroup> selectedMuscles;
  final List<MuscleGroup> allMuscles;
}

class ExerciseError extends ExerciseState {
  ExerciseError(this.error);
  final String error;
}

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {

  ExerciseBloc({required this.exerciseRepository}) : super(ExerciseLoading()) {
    on<FilterExerciseEvent>(
      _onFilter,
    );
    on<SearchExerciseEvent>(_onSearch, transformer: debounce());
    on<LoadedExerciseEvent>(_onLoaded);

    _initializeMuscles();

    _exerciseSubscription = exerciseRepository
        .watchExercisesWithFilters(_query, _filters)
        .listen((exercises) {
      add(LoadedExerciseEvent(exercises));
    });
  }
  final LocalExerciseRepository exerciseRepository;
  late List<MuscleGroup> _muscles;
  String _query = '';
  List<MuscleGroup> _filters = [];
  late StreamSubscription<List<Exercise>> _exerciseSubscription;

  EventTransformer<ExerciseEvent> debounce<ExerciseEvent>() {
    return (events, mapper) {
      return events
          .debounceTime(const Duration(milliseconds: 100))
          .switchMap(mapper);
    };
  }

  Future<void> _initializeMuscles() async {
    _muscles = await exerciseRepository.getAllMuscleGroups();
  }

  @override
  Future<void> close() {
    _exerciseSubscription.cancel();
    return super.close();
  }

  void _onLoaded(LoadedExerciseEvent event, Emitter<ExerciseState> emit) {
    if (_muscles.isEmpty) {
      emit(
          ExerciseLoading(),); // Emit a loading state if muscles are not yet loaded
      return;
    }
    emit(ExerciseLoaded(event.loadedExercises, _query, _filters, _muscles));
  }

  Future<void> _onFilter(
      FilterExerciseEvent event, Emitter<ExerciseState> emit,) async {
    emit(ExerciseLoading());
    _filters = event.selectedMuscles;
    try {
      final exerciseStream =
          exerciseRepository.watchExercisesWithFilters(_query, _filters);
      await _exerciseSubscription.cancel();
      _exerciseSubscription = exerciseStream.listen(
        (exercises) {
          add(LoadedExerciseEvent(exercises));
        },
        onError: (error) {
          emit(ExerciseError('Error $error'));
        },
      );
    } catch (e) {
      emit(ExerciseError(e.toString()));
    }
  }

  Future<void> _onSearch(
      SearchExerciseEvent event, Emitter<ExerciseState> emit,) async {
    emit(ExerciseLoading());
    _query = event.query;
    try {
      final exerciseStream =
          exerciseRepository.watchExercisesWithFilters(_query, _filters);
      await _exerciseSubscription.cancel();
      _exerciseSubscription = exerciseStream.listen(
        (exercises) {
          add(LoadedExerciseEvent(exercises));
        },
        onError: (error) {
          emit(ExerciseError('Error $error'));
        },
      );
    } catch (e) {
      emit(ExerciseError(e.toString()));
    }
  }
}
