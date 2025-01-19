import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/widgets/app_widgets.dart';

import '../data/models/muscle_group.dart';

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
      final repository = getIt.get<LocalExerciseRepository>();
      final name = _nameController.text.trim();
      final description = _descriptionController.text.trim();
      setState(() {
        _isLoading = true;
      });
      try {
        repository.addExercise(name, description, selected);
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
    return AppScaffold(
        title: "Add exercise",
        actions: [
          _isLoading
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton.icon(
                    onPressed: _insertExercise,
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                  ),
                ),
        ],
        child: Form(
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
                      await context.push('/add/pick', extra: selected);

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
