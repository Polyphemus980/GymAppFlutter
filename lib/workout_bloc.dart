import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/data/models/exercise.dart';

sealed class WorkoutEvent {}

class AddExercise extends WorkoutEvent {
  final Exercise exercise;

  AddExercise({required this.exercise});
}

class DeleteExercise extends WorkoutEvent {
  final Exercise exercise;

  DeleteExercise({required this.exercise});
}

sealed class WorkoutState {}

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc(super.initialState);
}
