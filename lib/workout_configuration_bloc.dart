import 'package:flutter_bloc/flutter_bloc.dart';

abstract class WorkoutConfigurationState {}

class InitialState extends WorkoutConfigurationState {}

abstract class WorkoutConfigurationEvent {}

class ExercisesAddedEvent extends WorkoutConfigurationEvent {}

class WorkoutConfigurationBloc
    extends Bloc<WorkoutConfigurationEvent, WorkoutConfigurationState> {
  WorkoutConfigurationBloc() : super(InitialState());
}
