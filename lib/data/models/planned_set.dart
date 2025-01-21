import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';

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
  final int id;
  final String userId;
  final int workoutExerciseId;
  final int setNumber;
  final int minRepetitions;
  final int maxRepetitions;
  final double rpe;
}

@UseRowClass(PlannedSet)
class PlannedSets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  IntColumn get workoutExerciseId =>
      integer().references(PlannedWorkoutExercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get minRepetitions => integer()();
  IntColumn get maxRepetitions => integer()();
  RealColumn get rpe => real()();
}
