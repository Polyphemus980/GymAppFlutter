import 'package:drift/drift.dart';
import 'package:gym_app/data/models/completed/completed_workout_exercise.dart';
import 'package:gym_app/data/models/planned/planned_workout.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:uuid/uuid.dart';

import '../../model_interfaces/dirty_table.dart';

part 'completed_workout.g.dart';

@json.JsonSerializable()
class CompletedWorkout {
  final String id;
  final String user_id;
  final String? planned_workout_id;
  final String? workout_name;
  final DateTime workout_date;
  final DateTime? start_time;
  final DateTime? end_time;
  final int? total_duration;
  final String? notes;
  final DateTime created_at;
  final DateTime? updated_at;
  final bool dirty;
  @json.JsonKey(includeFromJson: false, includeToJson: false)
  List<CompletedWorkoutExercise>? exercises;

  CompletedWorkout({
    required this.dirty,
    required this.id,
    required this.user_id,
    this.planned_workout_id,
    this.workout_name,
    required this.workout_date,
    this.start_time,
    this.end_time,
    this.total_duration,
    this.notes,
    required this.created_at,
    this.updated_at,
    this.exercises,
  });

  factory CompletedWorkout.fromJson(Map<String, dynamic> json) =>
      _$CompletedWorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$CompletedWorkoutToJson(this);
}

@UseRowClass(CompletedWorkout)
class CompletedWorkouts extends Table implements DirtyTable {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get user_id => text()();
  TextColumn get planned_workout_id =>
      text().nullable().references(PlannedWorkouts, #id)();
  TextColumn get workout_name => text().nullable()();
  DateTimeColumn get workout_date =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get start_time => dateTime().nullable()();
  DateTimeColumn get end_time => dateTime().nullable()();
  IntColumn get total_duration =>
      integer().nullable().check(total_duration.isBiggerThanValue(0))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get created_at => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updated_at => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  BoolColumn get dirty => boolean()();
}
