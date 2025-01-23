import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'planned_set.g.dart';

@JsonSerializable()
class PlannedSet {
  PlannedSet({
    required this.dirty,
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
  final bool dirty;

  factory PlannedSet.fromJson(Map<String, dynamic> json) =>
      _$PlannedSetFromJson(json);
  Map<String, dynamic> toJson() => _$PlannedSetToJson(this);
}

@UseRowClass(PlannedSet)
class PlannedSets extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get workoutExerciseId =>
      text().references(PlannedWorkoutExercises, #id)();
  BoolColumn get dirty => boolean()();
  IntColumn get setNumber => integer()();
  IntColumn get minRepetitions => integer()();
  IntColumn get maxRepetitions => integer()();
  RealColumn get rpe => real()();
}
