import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/widgets/app_widgets.dart';

import '../data/models/muscle_group.dart';
import '../get_it_dependency_injection.dart';

class MusclePicker extends StatefulWidget {
  const MusclePicker({super.key, required this.list});
  final List<MuscleGroup> list;
  @override
  State<StatefulWidget> createState() {
    return _MusclePickerState();
  }
}

class _MusclePickerState extends State<MusclePicker> {
  final exerciseRepository = getIt.get<LocalExerciseRepository>();
  List<MuscleGroup> muscles = [];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Pick muscle groups',
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilledButton.icon(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.check),
            label: const Text('Done'),
          ),
        ),
      ],
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: exerciseRepository.getAllMuscleGroups(),
              builder: (build, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Loading muscle groups...'),
                      ],
                    ),
                  );
                } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fitness_center,
                          size: 48,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text('No muscle groups available'),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (build, index) {
                      final ValueNotifier<bool> isChecked = ValueNotifier(
                        widget.list.contains(snapshot.data!.elementAt(index)),
                      );

                      return ValueListenableBuilder<bool>(
                        valueListenable: isChecked,
                        builder: (context, value, child) {
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            color: value
                                ? Theme.of(context)
                                    .primaryColor
                                    .withValues(alpha: 0.5)
                                : Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withValues(alpha: 0.5),
                            child: ListTile(
                              leading: Icon(
                                Icons.fitness_center,
                                color: value
                                    ? Colors.green
                                    : Theme.of(context).colorScheme.secondary,
                              ),
                              title: Text(
                                snapshot.data!.elementAt(index).name,
                                style: TextStyle(
                                  fontWeight: value
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              trailing: Checkbox(
                                value: isChecked.value,
                                onChanged: (value) {
                                  if (value == true) {
                                    widget.list
                                        .add(snapshot.data!.elementAt(index));
                                  } else {
                                    widget.list.remove(
                                        snapshot.data!.elementAt(index));
                                  }
                                  isChecked.value = !isChecked.value;
                                },
                              ),
                              onTap: () {
                                if (isChecked.value) {
                                  widget.list
                                      .remove(snapshot.data!.elementAt(index));
                                } else {
                                  widget.list
                                      .add(snapshot.data!.elementAt(index));
                                }
                                isChecked.value = !isChecked.value;
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
