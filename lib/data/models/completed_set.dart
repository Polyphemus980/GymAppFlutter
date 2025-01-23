import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'completed_workout_exercise.dart';

part 'completed_set.g.dart';

@JsonSerializable()
class CompletedSet {
  final String id;
  final String user_id;
  final String workout_exercise_id;
  final int set_number;
  final int repetitions;
  final int? duration_seconds;
  final bool dirty;
  final double? weight;
  final DateTime? created_at;
  final DateTime? updated_at;

  CompletedSet({
    required this.dirty,
    required this.user_id,
    required this.id,
    required this.workout_exercise_id,
    required this.set_number,
    required this.repetitions,
    this.duration_seconds,
    this.weight,
    this.created_at,
    this.updated_at,
  });

  factory CompletedSet.fromJson(Map<String, dynamic> json) =>
      _$CompletedSetFromJson(json);
  Map<String, dynamic> toJson() => _$CompletedSetToJson(this);

  double? get volume => weight != null ? weight! * repetitions : null;
}

@UseRowClass(CompletedSet)
class CompletedSets extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get user_id => text()();
  TextColumn get workout_exercise_id =>
      text().references(CompletedWorkoutExercises, #id)();
  IntColumn get set_number => integer()();
  BoolColumn get dirty => boolean()();
  IntColumn get repetitions => integer()();
  IntColumn get duration_seconds => integer().nullable()();
  RealColumn get weight => real().nullable()();
  DateTimeColumn get created_at => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updated_at => dateTime().nullable()();
}
