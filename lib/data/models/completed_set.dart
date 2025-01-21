import 'package:drift/drift.dart';

import 'completed_workout_exercise.dart';

class CompletedSet {
  final int id;
  final String userId;
  final int workoutExerciseId;
  final int setNumber;
  final int repetitions;
  final int? durationSeconds;
  final double? weight;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CompletedSet({
    required this.userId,
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

@UseRowClass(CompletedSet)
class CompletedSets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  IntColumn get workoutExerciseId =>
      integer().references(CompletedWorkoutExercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get repetitions => integer()();
  IntColumn get durationSeconds => integer().nullable()();
  RealColumn get weight => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
