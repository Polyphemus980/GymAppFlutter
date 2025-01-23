import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'completed_workout_exercise.dart';

part 'completed_set.g.dart';

@JsonSerializable()
class CompletedSet {
  final String id;
  final String userId;
  final String workoutExerciseId;
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
  factory CompletedSet.fromJson(Map<String, dynamic> json) =>
      _$CompletedSetFromJson(json);
  Map<String, dynamic> toJson() => _$CompletedSetToJson(this);
  double? get volume => weight != null ? weight! * repetitions : null;
}

@UseRowClass(CompletedSet)
class CompletedSets extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get workoutExerciseId =>
      text().references(CompletedWorkoutExercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get repetitions => integer()();
  IntColumn get durationSeconds => integer().nullable()();
  RealColumn get weight => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
