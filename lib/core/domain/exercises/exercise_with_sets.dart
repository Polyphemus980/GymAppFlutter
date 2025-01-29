import 'package:gym_app/data/models/completed/completed_set.dart';
import 'package:gym_app/data/models/exercise/exercise.dart';

class ExerciseWithSets {

  ExerciseWithSets({required this.exercise, required this.sets});
  final Exercise exercise;
  final List<CompletedSet> sets;
}
