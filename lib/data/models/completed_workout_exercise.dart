import 'package:drift/drift.dart';
import 'package:gym_app/data/models/completed_workout.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'completed_set.dart';

part 'completed_workout_exercise.g.dart';

@JsonSerializable()
class CompletedWorkoutExercise {
  final String id;
  final String userId;
  final String workoutId;
  final String exerciseId;
  final int exerciseOrder;
  final DateTime createdAt;
  final String? notes;
  final DateTime? updatedAt;

  List<CompletedSet>? sets;

  CompletedWorkoutExercise({
    required this.id,
    required this.userId,
    required this.workoutId,
    required this.exerciseId,
    required this.exerciseOrder,
    required this.createdAt,
    this.notes,
    this.updatedAt,
    this.sets,
  });

  int get totalSets => sets?.length ?? 0;

  factory CompletedWorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$CompletedWorkoutExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$CompletedWorkoutExerciseToJson(this);
}

@UseRowClass(CompletedWorkoutExercise)
class CompletedWorkoutExercises extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get workoutId => text().references(CompletedWorkouts, #id)();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  IntColumn get exerciseOrder =>
      integer().check(exerciseOrder.isBiggerOrEqualValue(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
}
