import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutListScreen extends StatefulWidget {
  const WorkoutListScreen({super.key});

  @override
  State<WorkoutListScreen> createState() => _WorkoutListScreenState();
}

class _WorkoutListScreenState extends State<WorkoutListScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
