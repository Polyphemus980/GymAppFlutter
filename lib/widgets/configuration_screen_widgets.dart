import 'package:flutter/material.dart';
import 'package:gym_app/data/models/exercise.dart';

class SetCard extends StatefulWidget {
  const SetCard({super.key, required this.exercise});

  final Exercise exercise;

  @override
  State<SetCard> createState() {
    return _SetCardState();
  }
}

class SetHelper {
  int? repCount;
  int? weight;
}

class _SetCardState extends State<SetCard> {
  final List<SetHelper> sets = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
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
                        sets[index].weight = int.tryParse(value);
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
                        sets[index].repCount = int.tryParse(value);
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
                sets.add(SetHelper());
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
