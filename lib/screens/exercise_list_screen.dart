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
      body: Column(children: [
        SearchBar(
          hintText: 'Search exercises',
        ),
        Expanded(
          child: StreamBuilder(
            stream: db.getExercises(), //db.select(db.exercises).watch(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Center(child: Text("No exercises found"));
              } else {
                final exerciseMuscles = snapshot.data!;

                return ListView.builder(
                  itemCount: exerciseMuscles.length,
                  itemBuilder: (context, index) {
                    final exercise = exerciseMuscles[index];
                    return ListTile(
                      title: Text(exercise.exercise.name),
                      subtitle: Text(
                          exercise.muscleGroups.map((m) => m.name).join(", ")),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          (db.delete(db.exercises)
                                ..where(
                                    (t) => t.id.equals(exercise.exercise.id)))
                              .go();
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ]),
    );
  }
}
