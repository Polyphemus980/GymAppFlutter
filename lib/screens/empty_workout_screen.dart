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
      required this.finishButtonOnTap,
      this.isRpe = false});
  final bool isRpe;
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

  void adjustSetIndices() {
    for (int i = 0; i < sets.length; i++) {
      for (int j = 0; j < sets[i].sets.length; j++) {
        sets[i].sets[j].setNumber = j;
      }
    }
  }

  bool validateRpe() {
    return sets
        .every((exercise) => exercise.sets.every((set) => set.rpe != null));
  }

  bool validateRepRange() {
    return sets.every((exercise) => exercise.sets.every((set) =>
        set.maxRepetitions != null &&
        set.minRepetitions != null &&
        set.minRepetitions! <= set.maxRepetitions!));
  }

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
                      isRpe: widget.isRpe,
                      sets: sets.length > index ? sets[index].sets : [],
                      index: index,
                      key: ValueKey(exercise),
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
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex -= 1;
                    }
                    final tempExercise = exercises.removeAt(oldIndex);
                    exercises.insert(newIndex, tempExercise);

                    if (sets.length > oldIndex) {
                      final tempSet = sets.removeAt(oldIndex);
                      if (newIndex < sets.length) {
                        sets.insert(newIndex, tempSet);
                      } else {
                        sets.add(tempSet);
                      }
                    }
                  });
                },
              ),
            ),
            AppInkWellButton(
              onTap: () async {
                await context.push('/new/select', extra: exercises);
                for (int i = sets.length; i < exercises.length; i++) {
                  sets.add(SetData(exercise: exercises[i], sets: []));
                }
                setState(() {});
              },
              //width: double.infinity,
              height: 50,

              text: "Add exercises",
            ),
            AppInkWellButton(
                onTap: () {
                  if (!(sets.isNotEmpty &&
                      sets.every((set) => set.sets.isNotEmpty))) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Each chosen exercise must have at least one set")));
                    return;
                  }
                  if (widget.isRpe) {
                    if (validateRpe()) {
                      if (validateRepRange()) {
                        adjustSetIndices();
                        widget.finishButtonOnTap(sets);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Each set must have min and max reps filled in correctly")));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Each set must have RPE filled in")));
                    }
                  } else {
                    adjustSetIndices();
                    widget.finishButtonOnTap(sets);
                  }
                },
                height: 50,
                text: widget.finishButtonText),
          ],
        ),
      ),
    );
  }
}
