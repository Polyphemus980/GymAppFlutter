import 'package:flutter/material.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/data_sources/workout_data_source.dart';
import 'package:gym_app/data/tables/workout.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WorkoutDataSource d = WorkoutDataSource(AppDatabase());
    return StreamBuilder<Workout?>(
        stream: d.watchWorkoutWithExercises(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show loading state
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Text("Workout not found"); // Handle empty state
          }

          final workout = snapshot.data!;

          return Column(
            children: [
              Text(workout.workoutName!),
              ...workout.exercises!.map((exercise) {
                return Column(
                  children: [
                    Text(exercise.id.toString()),
                    ...exercise.sets!.map((set) {
                      return Text(
                          "Set: ${set.repetitions} reps @ ${set.weight} kg");
                    }),
                  ],
                );
              }),
            ],
          );
        });
  }
}
