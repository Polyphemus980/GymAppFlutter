import 'package:flutter/material.dart';

import '../data/tables/exercise.dart';

class WorkoutExerciseItem extends StatefulWidget {
  final Exercise exercise;

  const WorkoutExerciseItem({
    super.key,
    required this.exercise,
  });

  @override
  State<WorkoutExerciseItem> createState() => _WorkoutExerciseItemState();
}

class _WorkoutExerciseItemState extends State<WorkoutExerciseItem> {
  // List to store the sets (each set contains weight and reps)
  List<Map<String, dynamic>> sets = [];

  void _addSet() {
    setState(() {
      sets.add({
        'weight': '',
        'reps': '',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              // Exercise name with menu icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.exercise.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),

              // Header row for sets
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Set", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("KG/LBS", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Reps", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),

              // List of sets
              ListView.builder(
                shrinkWrap: true,
                itemCount: sets.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${index + 1}"),
                      SizedBox(
                        width: 80,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Weight',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            sets[index]['weight'] = value;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Reps',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            sets[index]['reps'] = value;
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 10),

              // Button to add new sets
              ElevatedButton.icon(
                onPressed: _addSet,
                icon: const Icon(Icons.add),
                label: const Text("Add Set"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
