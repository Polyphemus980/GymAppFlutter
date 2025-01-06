import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push('/workout/new');
      },
      child: const Text("Start an empty workout"),
    );
  }
}
