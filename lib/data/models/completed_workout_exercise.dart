import 'package:drift/drift.dart';
import 'package:gym_app/data/models/completed_workout.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:uuid/uuid.dart';

import 'completed_set.dart';

part 'completed_workout_exercise.g.dart';

@json.JsonSerializable()
class CompletedWorkoutExercise {
  final String id;
  final String user_id;
  final String workout_id;
  final String exercise_id;
  final int exercise_order;
  final DateTime created_at;
  final String? notes;
  final DateTime? updated_at;
  final bool dirty;
  @json.JsonKey(includeFromJson: false, includeToJson: false)
  List<CompletedSet>? sets;

  CompletedWorkoutExercise({
    required this.dirty,
    required this.id,
    required this.user_id,
    required this.workout_id,
    required this.exercise_id,
    required this.exercise_order,
    required this.created_at,
    this.notes,
    this.updated_at,
    this.sets,
  });

  int get total_sets => sets?.length ?? 0;

  factory CompletedWorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$CompletedWorkoutExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$CompletedWorkoutExerciseToJson(this);
}

@UseRowClass(CompletedWorkoutExercise)
class CompletedWorkoutExercises extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get user_id => text()();
  BoolColumn get dirty => boolean()();
  TextColumn get workout_id => text().references(CompletedWorkouts, #id)();
  TextColumn get exercise_id => text().references(Exercises, #id)();
  IntColumn get exercise_order =>
      integer().check(exercise_order.isBiggerOrEqualValue(0))();
  DateTimeColumn get created_at => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updated_at => dateTime().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
