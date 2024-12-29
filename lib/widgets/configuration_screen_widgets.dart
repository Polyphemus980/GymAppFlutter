import 'package:flutter/material.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/models/sets.dart';

class SetCard extends StatefulWidget {
  const SetCard({super.key, required this.exercise});

  final Exercise exercise;

  @override
  State<SetCard> createState() {
    return _SetCardState();
  }
}

class _SetCardState extends State<SetCard> {
  final List<WorkoutConfigSet> sets = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 24.0, 16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: theme.canvasColor,
        border: Border.all(color: theme.dividerColor, width: 1.0),
      ),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(widget.exercise.name,
                  style: theme.textTheme.labelLarge)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Set", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("KG/LBS", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Reps", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: sets.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${index + 1}"),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: "Weight",
                        hintText: "Weight",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        sets[index].weight = double.tryParse(value);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: "Reps",
                        hintText: "Reps",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        sets[index].repetitions = int.tryParse(value);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => setState(() {
                sets.add(WorkoutConfigSet(
                    exerciseId: widget.exercise.id, setNumber: sets.length));
              }),
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => setState(() {
                sets.removeLast();
              }),
            )
          ]),
        ],
      ),
    );
  }
}
