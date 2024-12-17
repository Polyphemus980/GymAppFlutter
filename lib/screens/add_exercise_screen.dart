import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:provider/provider.dart';

import '../data/tables/muscle_group.dart';

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({super.key});

  @override
  AddExerciseScreenState createState() => AddExerciseScreenState();
}

class AddExerciseScreenState extends State<AddExerciseScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _isLoading = false;
  List<MuscleGroup> selected = [];
  String text = "";

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool validateMuscles() {
    return selected.isNotEmpty;
  }

  Future<void> _insertExercise() async {
    if ((_formKey.currentState?.validate() ?? false) && validateMuscles()) {
      final db = Provider.of<AppDatabase>(context, listen: false);
      final name = _nameController.text.trim();
      final description = _descriptionController.text.trim();
      ExercisesCompanion exerciseCompanion = ExercisesCompanion(
          name: drift.Value(name), description: drift.Value(description));
      setState(() {
        _isLoading = true;
      });
      try {
        final exercise =
            await db.into(db.exercises).insertReturning(exerciseCompanion);
        await db.insertExerciseMuscles(selected, exercise.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Exercise '$name' added successfully!")),
          );
          context.pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to add exercise: $e")),
          );
        }
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Center(child: Text("Add exercise")), actions: [
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _insertExercise,
                  child: const Text('Save'),
                ),
        ]),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              TextFormField(
                  controller: _nameController,
                  decoration:
                      const InputDecoration(label: Text('Exercise Name')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name must not be empty';
                    }
                    return null;
                  }),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration:
                    const InputDecoration(label: Text('Exercise Description')),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  // Label for the muscles selection
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Muscle Groups', // The label text
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await context.push('/exercise/add/pick', extra: selected);

                      setState(() {
                        text = selected
                            .map((muscleGroup) => muscleGroup.name)
                            .join(', ');
                      });
                    },
                    child: Text(text.isNotEmpty ? text : 'Pick exercise'),
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
