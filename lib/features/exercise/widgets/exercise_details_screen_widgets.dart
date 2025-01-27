import 'package:flutter/material.dart';
import 'package:gym_app/data/models/completed/completed_set.dart';
import 'package:intl/intl.dart';

class ExerciseSetDetails extends StatelessWidget {
  final int index;
  final CompletedSet set;
  const ExerciseSetDetails({required this.index, super.key, required this.set});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Text('${index + 1}',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer)),
        ),
        title: Text(
          'Set ${index + 1}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Reps: ${set.repetitions} • Weight: ${set.weight ?? 0}${set.is_metric ? 'kg' : 'lbs'}',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        trailing: Text(
          DateFormat('yyyy-MM-dd').format(set.created_at),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
