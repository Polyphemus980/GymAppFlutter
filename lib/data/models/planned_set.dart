import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';

class PlannedSet {
  PlannedSet({
    required this.id,
    required this.workoutExerciseId,
    required this.setNumber,
    required this.repetitions,
    this.weight,
  });
  final int id;
  final int workoutExerciseId;
  final int setNumber;
  final int repetitions;
  final double? weight;
}

@UseRowClass(PlannedSet)
class PlannedSets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutExerciseId =>
      integer().references(PlannedWorkoutExercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get repetitions => integer()();
  RealColumn get weight => real().nullable()();
}
