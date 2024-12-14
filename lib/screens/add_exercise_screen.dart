import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:provider/provider.dart';

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
  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _insertExercise() async {
    if (_formKey.currentState?.validate() ?? false) {
      final db = Provider.of<AppDatabase>(context, listen: false);
      final name = _nameController.text.trim();
      final description = _descriptionController.text.trim();
      ExercisesCompanion exercise = ExercisesCompanion(
          name: drift.Value(name), description: drift.Value(description));
      setState(() {
        _isLoading = true;
      });
      try {
        await db.insertExercise(exercise);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Exercise '$name' added successfully!")),
        );
        _formKey.currentState?.reset();
        _nameController.clear();
        _descriptionController.clear();
        // Only pop the screen after the insertion is successful
        context.pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add exercise: $e")),
        );
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
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          )
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
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _insertExercise,
                      child: const Text('Save Exercise'),
                    ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.reset();
                  _nameController.clear();
                  _descriptionController.clear();
                },
                child: const Text('Clear Form'),
              ),
            ]),
          ),
        ));
  }
}
