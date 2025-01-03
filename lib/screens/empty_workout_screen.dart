import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/models/sets.dart';
import 'package:gym_app/widgets/configuration_screen_widgets.dart';

import '../data/models/exercise.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class SetData {
  final Exercise exercise;
  final List<WorkoutConfigSet> sets;
  int currentIndex;

  SetData({required this.exercise, required this.sets, this.currentIndex = 0});

  SetData copyWith({Exercise? exercise, List<WorkoutConfigSet>? sets}) {
    return SetData(
        exercise: exercise ?? this.exercise, sets: sets ?? this.sets);
  }
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<Exercise> exercises = [];
  List<SetData> sets = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await context.push('/workout/new/select', extra: exercises);
                    setState(() {});
                  },
                  child: const Text("Add exercises"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/workout/new/start', extra: sets);
                  },
                  child: const Text("Start workout"),
                ),
              ),
              Expanded(
                child: ReorderableListView.builder(
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return SetCard(
                        key: ValueKey(exercise),
                        exercise: exercise,
                        onUpdate: (List<WorkoutConfigSet> set) {
                          while (sets.length <= index) {
                            sets.add(SetData(exercise: exercise, sets: []));
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
            ],
          ),
        ],
      ),
    );
  }
}
