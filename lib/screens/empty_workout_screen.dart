import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/models/set_data.dart';
import 'package:gym_app/data/models/workout_config_set.dart';
import 'package:gym_app/widgets/app_widgets.dart';
import 'package:gym_app/widgets/configuration_screen_widgets.dart';

import '../data/models/exercise.dart';

class PreWorkoutScreen extends StatefulWidget {
  const PreWorkoutScreen(
      {super.key,
      this.data,
      required this.title,
      required this.finishButtonText,
      required this.finishButtonOnTap});
  final String title;
  final String finishButtonText;
  final List<SetData>? data;
  final void Function(List<SetData>) finishButtonOnTap;

  @override
  State<PreWorkoutScreen> createState() => _PreWorkoutScreenState();
}

class _PreWorkoutScreenState extends State<PreWorkoutScreen> {
  late List<Exercise> exercises;
  late List<SetData> sets;

  @override
  void initState() {
    super.initState();
    sets = widget.data ?? [];
    exercises = widget.data != null
        ? widget.data!.map((set) => set.exercise).toList()
        : [];
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.title,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Expanded(
              child: ReorderableListView.builder(
                buildDefaultDragHandles: false,
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return SetCard(
                      sets: sets.length > index ? sets[index].sets : [],
                      index: index,
                      key: ValueKey(index),
                      exercise: exercise,
                      onUpdate: (List<WorkoutConfigSet> set) {
                        int i = sets.length;
                        while (sets.length <= index) {
                          sets.add(SetData(exercise: exercises[i], sets: []));
                          i++;
                        }
                        sets[index] = sets[index].copyWith(sets: set);
                        setState(() {});
                      });
                },
                onReorder: (int oldIndex, int newIndex) {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final temp = exercises.removeAt(oldIndex);
                  exercises.insert(newIndex, temp);
                },
              ),
            ),
            InkWell(
              onTap: () async {
                await context.push('/workout/new/select', extra: exercises);
                setState(() {});
              },
              child: Container(
                //width: double.infinity,
                height: 75,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                child: Center(
                  child: Text("Add exercises",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (sets.isNotEmpty &&
                    sets.every((set) => set.sets.isNotEmpty)) {
                  widget.finishButtonOnTap(sets);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          "Each chosen exercise must have at least one set")));
                }
              },
              child: Container(
                //width: double.infinity,
                height: 75,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                child: Center(
                  child: Text(widget.finishButtonText,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
