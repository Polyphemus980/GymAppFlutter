import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_set.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'exercise.dart';

part 'planned_workout_exercise.g.dart';

@JsonSerializable()
class PlannedWorkoutExercise {
  final String id;
  final String userId;
  final String workoutId;
  final String exerciseId;
  final int exerciseOrder;
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<PlannedSet>? sets;
  Exercise? exercise;

  PlannedWorkoutExercise({
    required this.id,
    required this.userId,
    required this.workoutId,
    required this.exerciseId,
    required this.exerciseOrder,
    required this.createdAt,
    this.updatedAt,
    this.sets,
  });

  factory PlannedWorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$PlannedWorkoutExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$PlannedWorkoutExerciseToJson(this);

  int get totalSets => sets?.length ?? 0;
}

@UseRowClass(PlannedWorkoutExercise)
class PlannedWorkoutExercises extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get workoutId => text().references(PlannedWorkouts, #id)();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  IntColumn get exerciseOrder =>
      integer().check(exerciseOrder.isBiggerOrEqualValue(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
