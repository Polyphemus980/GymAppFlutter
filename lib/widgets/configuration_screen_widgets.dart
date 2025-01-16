import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/models/workout_config_set.dart';
import 'package:gym_app/screens/focus_workout_screen.dart';

import 'app_widgets.dart';

class SetCard extends StatefulWidget {
  const SetCard({
    super.key,
    required this.index,
    required this.exercise,
    required this.onUpdate,
    this.sets,
  });
  final int index;
  final Exercise exercise;
  final List<WorkoutConfigSet>? sets;
  final Function(List<WorkoutConfigSet>) onUpdate;

  @override
  State<SetCard> createState() => _SetCardState();
}

class _SetCardState extends State<SetCard> {
  late List<WorkoutConfigSet> sets;

  @override
  void initState() {
    super.initState();
    sets = widget.sets ?? [];
  }

  void addSet() {
    setState(() {
      WorkoutConfigSet newSet = WorkoutConfigSet(
        completed: false,
        exerciseId: widget.exercise.id,
        setNumber: sets.length,
      );
      sets.add(newSet);
    });
    widget.onUpdate(sets);
  }

  void removeSet() {
    if (sets.isNotEmpty) {
      setState(() {
        sets.removeLast();
      });
      widget.onUpdate(sets);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.surface,
              colorScheme.surface.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Exercise Header
            Container(
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.exercise.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  ReorderableDragStartListener(
                    index: widget.index,
                    child: Icon(
                      Icons.drag_handle,
                      color:
                          colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  SizedBox(
                      width: 40,
                      child: Text("SET", style: theme.textTheme.labelSmall)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("WEIGHT", style: theme.textTheme.labelSmall),
                        Text("REPS", style: theme.textTheme.labelSmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            if (sets.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sets.length,
                itemBuilder: (context, index) {
                  return SetRow(
                    key: ValueKey(
                        '${widget.exercise.id}_${sets[index].setNumber}'),
                    index: index,
                    set: sets[index],
                    onUpdate: (updatedSet) {
                      sets[index] = updatedSet;
                      widget.onUpdate(sets);
                    },
                  );
                },
              ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActionButton(
                    icon: Icons.remove,
                    label: "Remove Set",
                    onPressed: sets.isEmpty ? null : removeSet,
                    colorScheme: colorScheme,
                  ),
                  ActionButton(
                    icon: Icons.add,
                    label: "Add Set",
                    onPressed: addSet,
                    colorScheme: colorScheme,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.colorScheme,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: TextButton.icon(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor:
                colorScheme.primaryContainer.withValues(alpha: 0.5),
            foregroundColor: colorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          icon: Icon(icon, size: 20),
          label: Text(label),
        ),
      ),
    );
  }
}

class SetRow extends StatefulWidget {
  const SetRow({
    super.key,
    required this.index,
    required this.set,
    required this.onUpdate,
  });

  final int index;
  final WorkoutConfigSet set;
  final Function(WorkoutConfigSet) onUpdate;

  @override
  State<SetRow> createState() => _SetRowState();
}

class _SetRowState extends State<SetRow> {
  late final TextEditingController weightController;
  late final TextEditingController repsController;

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController(
      text: widget.set.weight?.toString() ?? '',
    );
    repsController = TextEditingController(
      text: widget.set.repetitions?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    weightController.dispose();
    repsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: colorScheme.primaryContainer,
              child: Text(
                "${widget.index + 1}",
                style: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  child: AppTextFormField(
                    labelText: "Weight",
                    hintText: "0",
                    formatters: [
                      WeightInputFormatter(),
                      LengthLimitingTextInputFormatter(7),
                    ],
                    controller: weightController,
                    width: 80,
                    height: 45,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        final double? parsedValue = double.tryParse(value);
                        if (parsedValue != null) {
                          widget.set.weight = parsedValue;
                          widget.onUpdate(widget.set);
                        }
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: AppTextFormField(
                    labelText: "Reps",
                    hintText: "0",
                    formatters: [
                      RepsInputFormatter(),
                      LengthLimitingTextInputFormatter(3),
                    ],
                    controller: repsController,
                    width: 80,
                    height: 45,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        final int? parsedValue = int.tryParse(value);
                        if (parsedValue != null) {
                          widget.set.repetitions = parsedValue;
                          widget.onUpdate(widget.set);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
