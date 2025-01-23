import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'planned_set.g.dart';

@JsonSerializable()
class PlannedSet {
  PlannedSet({
    required this.dirty,
    required this.user_id,
    required this.rpe,
    required this.id,
    required this.workout_exercise_id,
    required this.set_number,
    required this.min_repetitions,
    required this.max_repetitions,
  });
  final String id;
  final String user_id;
  final String workout_exercise_id;
  final int set_number;
  final int min_repetitions;
  final int max_repetitions;
  final double rpe;
  final bool dirty;

  factory PlannedSet.fromJson(Map<String, dynamic> json) =>
      _$PlannedSetFromJson(json);
  Map<String, dynamic> toJson() => _$PlannedSetToJson(this);
}

@UseRowClass(PlannedSet)
class PlannedSets extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get user_id => text()();
  TextColumn get workout_exercise_id =>
      text().references(PlannedWorkoutExercises, #id)();
  BoolColumn get dirty => boolean()();
  IntColumn get set_number => integer()();
  IntColumn get min_repetitions => integer()();
  IntColumn get max_repetitions => integer()();
  RealColumn get rpe => real()();
}
