import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:uuid/uuid.dart';

part 'workout_plan.g.dart';

@json.JsonSerializable()
class WorkoutPlan {
  WorkoutPlan({
    required this.dirty,
    required this.num_weeks,
    required this.days_per_week,
    required this.user_id,
    required this.id,
    required this.description,
    required this.name,
    required this.created_at,
    this.updated_at,
  });
  final String id;
  final String user_id;
  final String name;
  final String description;
  final int num_weeks;
  final int days_per_week;
  final DateTime created_at;
  final DateTime? updated_at;
  final bool dirty;

  @json.JsonKey(includeFromJson: false, includeToJson: false)
  List<PlannedWorkout>? workouts;

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) =>
      _$WorkoutPlanFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutPlanToJson(this);
}

@UseRowClass(WorkoutPlan)
class WorkoutPlans extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get user_id => text()();
  TextColumn get description => text()();
  TextColumn get name => text().withLength(min: 1)();
  IntColumn get num_weeks => integer()();
  BoolColumn get dirty => boolean()();
  IntColumn get days_per_week => integer()
      .check(days_per_week.isBiggerOrEqualValue(0))
      .check(days_per_week.isSmallerOrEqualValue(7))();
  DateTimeColumn get created_at => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updated_at => dateTime().nullable()();
}
