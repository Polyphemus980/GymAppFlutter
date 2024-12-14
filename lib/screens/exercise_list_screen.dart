import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:provider/provider.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercises")),
        actions: [
          ElevatedButton(
            onPressed: () => context.push('/exercise/add'),
            child: const Text("Add new"),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: db.select(db.exercises).watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No exercises found"));
          } else {
            final exercises = snapshot.data!;

            return ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return ListTile(
                  title: Text(exercise.name),
                  subtitle: exercise.description != null
                      ? Text(exercise.description!)
                      : null,
                );
              },
            );
          }
        },
      ),
    );
  }
}
