import 'package:drift/drift.dart';

import 'workout_exercise.dart';

class ExerciseSet {
  final int id;
  final int workoutExerciseId;
  final int setNumber;
  final int repetitions;
  final int? durationSeconds;
  final double? weight;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ExerciseSet({
    required this.id,
    required this.workoutExerciseId,
    required this.setNumber,
    required this.repetitions,
    this.durationSeconds,
    this.weight,
    this.createdAt,
    this.updatedAt,
  });

  double? get volume => weight != null ? weight! * repetitions : null;
}

@UseRowClass(ExerciseSet)
class ExerciseSets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutExerciseId =>
      integer().references(WorkoutExercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get repetitions => integer()();
  IntColumn get durationSeconds => integer().nullable()();
  RealColumn get weight => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
