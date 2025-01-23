import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:gym_app/data/models/workout_plan.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:uuid/uuid.dart';

part 'planned_workout.g.dart';

@json.JsonSerializable()
class PlannedWorkout {
  final String id;
  final String user_id;
  final String workout_plan_id;
  final String? workout_name;
  final int day_number;
  final int week_number; // Added for workout plan ordering
  final String? description; // Added for instructions
  final DateTime created_at;
  final bool dirty;
  final DateTime? updated_at;

  @json.JsonKey(includeFromJson: false, includeToJson: false)
  List<PlannedWorkoutExercise>? exercises;

  PlannedWorkout({
    required this.dirty,
    required this.user_id,
    required this.id,
    required this.workout_plan_id,
    this.workout_name,
    required this.day_number,
    required this.week_number,
    this.description,
    required this.created_at,
    this.updated_at,
    this.exercises,
  });

  factory PlannedWorkout.fromJson(Map<String, dynamic> json) =>
      _$PlannedWorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$PlannedWorkoutToJson(this);
}

@UseRowClass(PlannedWorkout)
class PlannedWorkouts extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get user_id => text()();
  TextColumn get workout_plan_id => text().references(WorkoutPlans, #id)();
  TextColumn get workout_name => text().nullable()();
  IntColumn get day_number => integer()();
  IntColumn get week_number => integer()();
  BoolColumn get dirty => boolean()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get created_at => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updated_at => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
