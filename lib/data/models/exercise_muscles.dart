import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

import 'exercise.dart';
import 'muscle_group.dart';

part 'exercise_muscles.g.dart';

@JsonSerializable()
class ExerciseMuscle {
  ExerciseMuscle(
      {required this.dirty, required this.exerciseId, required this.muscleId});
  final int exerciseId;
  final int muscleId;
  final bool dirty;
  factory ExerciseMuscle.fromJson(Map<String, dynamic> json) =>
      _$ExerciseMuscleFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseMuscleToJson(this);
}

class ExerciseMuscles extends Table {
  BoolColumn get dirty => boolean()();
  TextColumn get exerciseId =>
      text().references(Exercises, #id, onDelete: KeyAction.cascade)();
  IntColumn get muscleGroupId =>
      integer().references(MuscleGroups, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {exerciseId, muscleGroupId};
}
