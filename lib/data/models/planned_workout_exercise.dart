import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_set.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:uuid/uuid.dart';

import 'dirty_table.dart';
import 'exercise.dart';

part 'planned_workout_exercise.g.dart';

@json.JsonSerializable()
class PlannedWorkoutExercise {
  final String id;
  final String user_id;
  final String workout_id;
  final String exercise_id;
  final int exercise_order;
  final DateTime created_at;
  final DateTime? updated_at;
  final bool dirty;

  @json.JsonKey(includeFromJson: false, includeToJson: false)
  List<PlannedSet>? sets;

  @json.JsonKey(includeFromJson: false, includeToJson: false)
  Exercise? exercise;

  PlannedWorkoutExercise({
    required this.id,
    required this.user_id,
    required this.workout_id,
    required this.exercise_id,
    required this.exercise_order,
    required this.created_at,
    this.updated_at,
    this.sets,
    required this.dirty,
  });

  factory PlannedWorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$PlannedWorkoutExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$PlannedWorkoutExerciseToJson(this);

  int get total_sets => sets?.length ?? 0;
}

@UseRowClass(PlannedWorkoutExercise)
class PlannedWorkoutExercises extends Table implements DirtyTable {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get user_id => text()();
  TextColumn get workout_id => text().references(PlannedWorkouts, #id)();
  TextColumn get exercise_id => text().references(Exercises, #id)();
  IntColumn get exercise_order =>
      integer().check(exercise_order.isBiggerOrEqualValue(0))();
  DateTimeColumn get created_at => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updated_at => dateTime().nullable()();
  @override
  Set<Column> get primaryKey => {id};
  @override
  BoolColumn get dirty => boolean()();
}
