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
  final Map<String, TextEditingController> weightControllers = {};
  final Map<String, TextEditingController> repetitionControllers = {};

  @override
  void initState() {
    super.initState();
    sets = widget.sets ?? [];
    _initializeControllers();
  }

  @override
  void didUpdateWidget(SetCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sets != widget.sets) {
      sets = widget.sets ?? [];
      _reinitializeControllers();
    }
  }

  void _reinitializeControllers() {
    for (var controller in weightControllers.values) {
      controller.dispose();
    }
    for (var controller in repetitionControllers.values) {
      controller.dispose();
    }
    weightControllers.clear();
    repetitionControllers.clear();

    _initializeControllers();
  }

  void _initializeControllers() {
    for (var set in sets) {
      String setId = '${widget.exercise.id}_${set.setNumber}';
      weightControllers[setId] = TextEditingController(
        text: set.weight?.toString() ?? '',
      );
      repetitionControllers[setId] = TextEditingController(
        text: set.repetitions?.toString() ?? '',
      );
    }
  }

  void addSet() {
    setState(() {
      WorkoutConfigSet newSet = WorkoutConfigSet(
        completed: false,
        exerciseId: widget.exercise.id,
        setNumber: sets.length,
      );
      sets.add(newSet);

      String setId = '${newSet.exerciseId}_${newSet.setNumber}';
      weightControllers[setId] = TextEditingController();
      repetitionControllers[setId] = TextEditingController();
    });
    widget.onUpdate(sets);
  }

  void removeSet() {
    if (sets.isNotEmpty) {
      setState(() {
        var removedSet = sets.removeLast();
        String setId = '${removedSet.exerciseId}_${removedSet.setNumber}';
        weightControllers[setId]?.dispose();
        weightControllers.remove(setId);
        repetitionControllers[setId]?.dispose();
        repetitionControllers.remove(setId);
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
                  String setId =
                      '${sets[index].exerciseId}_${sets[index].setNumber}';
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
                              "${index + 1}",
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
                                  controller: weightControllers[setId],
                                  width: 80,
                                  height: 44,
                                  onChanged: (value) {
                                    sets[index].weight = double.tryParse(value);
                                    widget.onUpdate(sets);
                                  },
                                  onEditingComplete: () {
                                    weightControllers[setId]!.text =
                                        sets[index].weight.toString();
                                    FocusScope.of(context).unfocus();
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
                                    LengthLimitingTextInputFormatter(7),
                                  ],
                                  controller: repetitionControllers[setId],
                                  width: 80,
                                  height: 44,
                                  onChanged: (value) {
                                    sets[index].repetitions =
                                        int.tryParse(value);
                                    widget.onUpdate(sets);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ActionButton(
                    icon: Icons.remove,
                    label: "Remove Set",
                    onPressed: sets.isEmpty ? null : removeSet,
                    colorScheme: colorScheme,
                  ),
                  _ActionButton(
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

class _ActionButton extends StatelessWidget {
  const _ActionButton({
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
