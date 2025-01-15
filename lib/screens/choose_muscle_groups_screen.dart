import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/widgets/app_widgets.dart';

import '../data/models/muscle_group.dart';
import '../main.dart';

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
      child: Column(
        children: [
          FutureBuilder(
              future: exerciseRepository.getAllMuscleGroups(),
              builder: (build, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('No muscle groups available'));
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (build, index) {
                          final ValueNotifier<bool> isChecked = ValueNotifier(
                              widget.list
                                  .contains(snapshot.data!.elementAt(index)));

                          return ValueListenableBuilder<bool>(
                              valueListenable: isChecked,
                              builder: (context, value, child) {
                                return ListTile(
                                    title: Text(
                                        snapshot.data!.elementAt(index).name),
                                    trailing: Checkbox(
                                        value: isChecked.value,
                                        onChanged: (value) {
                                          if (value == true) {
                                            widget.list.add(snapshot.data!
                                                .elementAt(index));
                                          } else {
                                            widget.list.remove(snapshot.data!
                                                .elementAt(index));
                                          }
                                          isChecked.value = !isChecked.value;
                                        }));
                              });
                        }),
                  );
                }
              }),
          ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('End picking')),
        ],
      ),
    );
  }
}
