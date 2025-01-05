import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/global_workout_bloc.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<GlobalWorkoutBloc>().add(ShowState());
        context.push('/workout/new');
      },
      child: const Text("Start an empty workout"),
    );
  }
}
