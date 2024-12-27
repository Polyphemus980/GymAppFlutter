import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/models/exercise.dart';
import '../widgets/workout_exercise_widget.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<Exercise> exercises = [];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: () async {
            await context.push('/workout/new/select', extra: exercises);
            setState(() {});
          },
          child: const Text("Add exercises")),
      Expanded(
          child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return WorkoutExerciseItem(
            exercise: exercises[index],
          );
        },
      ))
    ]);
  }
}
