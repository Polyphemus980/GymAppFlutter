import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

import 'exercise.dart';
import 'muscle_group.dart';

part 'exercise_muscles.g.dart';

@JsonSerializable()
class ExerciseMuscle {
  ExerciseMuscle(
      {required this.dirty,
      required this.exercise_id,
      required this.muscle_group_id});
  final int exercise_id;
  final int muscle_group_id;
  final bool dirty;
  factory ExerciseMuscle.fromJson(Map<String, dynamic> json) =>
      _$ExerciseMuscleFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseMuscleToJson(this);
}

class ExerciseMuscles extends Table {
  BoolColumn get dirty => boolean()();
  TextColumn get exercise_id =>
      text().references(Exercises, #id, onDelete: KeyAction.cascade)();
  IntColumn get muscle_group_id =>
      integer().references(MuscleGroups, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {exercise_id, muscle_group_id};
}
