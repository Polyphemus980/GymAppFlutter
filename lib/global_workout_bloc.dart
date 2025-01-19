import 'package:flutter_bloc/flutter_bloc.dart';

sealed class GlobalWorkoutState {}

class InitialState extends GlobalWorkoutState {}

class ShownState extends GlobalWorkoutState {}

sealed class GlobalWorkoutEvent {}

class ShowState extends GlobalWorkoutEvent {}

class GlobalWorkoutBloc extends Bloc<GlobalWorkoutEvent, GlobalWorkoutState> {
  GlobalWorkoutBloc() : super(InitialState()) {
    on<ShowState>(_onShowState);
  }
  void _onShowState(
      GlobalWorkoutEvent event, Emitter<GlobalWorkoutState> emit) {
    emit(ShownState());
  }
}
