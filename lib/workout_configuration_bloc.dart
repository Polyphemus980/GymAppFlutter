import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/models/exercise.dart';

abstract class WorkoutConfigurationState {}

class LoadingConfig extends WorkoutConfigurationState {}

abstract class WorkoutConfigurationEvent {}

class ExercisesAddedEvent extends WorkoutConfigurationEvent {}

class WorkoutConfigurationBloc
    extends Bloc<WorkoutConfigurationEvent, WorkoutConfigurationState> {
  List<Exercise> exercises = [];
  WorkoutConfigurationBloc() : super(LoadingConfig());
}
