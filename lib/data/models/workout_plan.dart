import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'workout_plan.g.dart';

@JsonSerializable()
class WorkoutPlan {
  WorkoutPlan(
      {required this.numWeeks,
      required this.daysPerWeek,
      required this.userId,
      required this.id,
      required this.description,
      required this.name,
      required this.createdAt,
      this.updatedAt});
  final String id;
  final String userId;
  final String name;
  final String description;
  final int numWeeks;
  final int daysPerWeek;
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<PlannedWorkout>? workouts;

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) =>
      _$WorkoutPlanFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutPlanToJson(this);
}

@UseRowClass(WorkoutPlan)
class WorkoutPlans extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get description => text()();
  TextColumn get name => text().withLength(min: 1)();
  IntColumn get numWeeks => integer()();
  IntColumn get daysPerWeek => integer()
      .check(daysPerWeek.isBiggerOrEqualValue(0))
      .check(daysPerWeek.isSmallerOrEqualValue(7))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
