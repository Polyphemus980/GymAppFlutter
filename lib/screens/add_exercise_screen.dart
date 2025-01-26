import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/context_extensions.dart';
import 'package:gym_app/data/models/muscle_group.dart';
import 'package:gym_app/data/repositories/sync_exercise_repository.dart';
import 'package:gym_app/get_it_dependency_injection.dart';
import 'package:gym_app/widgets/app_widgets.dart';

class AddExerciseScreen extends HookWidget {
  final SyncExerciseRepository syncExerciseRepository;
  const AddExerciseScreen({super.key, required this.syncExerciseRepository});

  Future<void> _insertExercise(String name, String description,
      List<MuscleGroup> muscles, BuildContext context) async {
    try {
      await syncExerciseRepository.addExerciseSync(
          context.currentUserId!, name, description, muscles, getIt.isOnline);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exercise '$name' added successfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to add exercise: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final musclesController = useTextEditingController();
    final selectedMuscles = useState(<MuscleGroup>[]);
    final isLoading = useState(false);
    return AppScaffold(
        title: 'Add exercise',
        child: Form(
            key: formKey.value,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 32.0),
                child: Column(spacing: 32, children: [
                  AppTextFormField(
                    width: double.infinity,
                    controller: nameController,
                    labelText: "Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Must have a name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  AppTextFormField(
                    width: double.infinity,
                    controller: descriptionController,
                    labelText: "Description",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Must have a description";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(spacing: 16, children: [
                    Expanded(
                        child: AppTextFormField(
                            width: double.infinity,
                            labelText: "Muscles",
                            controller: musclesController,
                            readOnly: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Must have a description";
                              } else {
                                return null;
                              }
                            })),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () async {
                        await context.push('/add/pick',
                            extra: selectedMuscles.value);
                        musclesController.text = selectedMuscles.value
                            .map((muscleGroup) => muscleGroup.name)
                            .join(', ');
                      },
                    )
                  ]),
                  SizedBox(
                    width: double.infinity,
                    height: 75,
                    child: isLoading.value
                        ? ElevatedButton(
                            onPressed: () {},
                            child: const Center(
                                child: CircularProgressIndicator()),
                          )
                        : ElevatedButton.icon(
                            icon: Icon(
                              Icons.save,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            onPressed: () async {
                              if (formKey.value.currentState!.validate()) {
                                await _insertExercise(
                                    nameController.text.trim(),
                                    descriptionController.text.trim(),
                                    selectedMuscles.value,
                                    context);
                                context.pop();
                              }
                            },
                            label: Text("Add",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary),
                          ),
                  )
                ]))));
  }
}
