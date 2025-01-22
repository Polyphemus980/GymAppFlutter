import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:uuid/uuid.dart';

class PlannedSet {
  PlannedSet({
    required this.userId,
    required this.rpe,
    required this.id,
    required this.workoutExerciseId,
    required this.setNumber,
    required this.minRepetitions,
    required this.maxRepetitions,
  });
  final String id;
  final String userId;
  final String workoutExerciseId;
  final int setNumber;
  final int minRepetitions;
  final int maxRepetitions;
  final double rpe;
}

@UseRowClass(PlannedSet)
class PlannedSets extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get workoutExerciseId =>
      text().references(PlannedWorkoutExercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get minRepetitions => integer()();
  IntColumn get maxRepetitions => integer()();
  RealColumn get rpe => real()();
}
