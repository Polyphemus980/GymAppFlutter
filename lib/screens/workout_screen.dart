import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/tables/exercise.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<Exercise> exercises = [];
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ElevatedButton(
        //     onPressed: () async {
        //       await context.push('/workout/select', extra: exercises);
        //       setState(() {
        //         text = exercises.map((ex) => ex.name).join(", ");
        //       });
        //     },
        //     child: Text("Chosen exercises: $text")),
        // Expanded(
        //     child: ListView.builder(
        //   itemCount: exercises.length,
        //   itemBuilder: (context, index) {
        //     return WorkoutExerciseItem(
        //       exercise: exercises[index],
        //     );
        //   },
        // ))
        ElevatedButton(
          onPressed: () {
            context.push('/workout/new');
          },
          child: const Text("Start an empty workout"),
        ),
        const Expanded(
          child: Center(child: Text("Here be workouts")),
        )
      ],
    );
  }
}
