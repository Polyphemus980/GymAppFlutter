import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:gym_app/data/models/workout_plan.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:uuid/uuid.dart';

part 'planned_workout.g.dart';

@json.JsonSerializable()
class PlannedWorkout {
  final String id;
  final String userId;

  final String workoutPlanId;
  final String? workoutName;
  final int dayNumber;
  final int weekNumber; // Added for workout plan ordering
  final String? description; // Added for instructions
  final DateTime createdAt;
  final bool dirty;

  final DateTime? updatedAt;

  @json.JsonKey(includeFromJson: false, includeToJson: false)
  List<PlannedWorkoutExercise>? exercises;

  PlannedWorkout({
    required this.dirty,
    required this.userId,
    required this.id,
    required this.workoutPlanId,
    this.workoutName,
    required this.dayNumber,
    required this.weekNumber,
    this.description,
    required this.createdAt,
    this.updatedAt,
    this.exercises,
  });

  factory PlannedWorkout.fromJson(Map<String, dynamic> json) =>
      _$PlannedWorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$PlannedWorkoutToJson(this);
}

@UseRowClass(PlannedWorkout)
class PlannedWorkouts extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get workoutPlanId => text().references(WorkoutPlans, #id)();
  TextColumn get workoutName => text().nullable()();
  IntColumn get dayNumber => integer()();
  IntColumn get weekNumber => integer()();
  BoolColumn get dirty => boolean()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
