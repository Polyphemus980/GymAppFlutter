import 'package:drift/drift.dart';
import 'package:gym_app/data/models/workout_plan.dart';
import 'package:json_annotation/json_annotation.dart' as json;

import 'dirty_table.dart';

part 'user_workout_plans.g.dart';

@json.JsonSerializable()
class UserWorkoutPlans {
  final String user_id;
  final String workout_plan_id;
  final int current_week;
  final int current_day;
  final bool dirty;

  UserWorkoutPlans({
    required this.user_id,
    required this.workout_plan_id,
    required this.dirty,
    required this.current_week,
    required this.current_day,
  });

  @json.JsonKey(includeFromJson: false, includeToJson: false)
  WorkoutPlan? plan;

  factory UserWorkoutPlans.fromJson(Map<String, dynamic> json) =>
      _$UserWorkoutPlansFromJson(json);
  Map<String, dynamic> toJson() => _$UserWorkoutPlansToJson(this);
}

class UserWorkoutPlansTable extends Table implements DirtyTable {
  TextColumn get user_id => text()();
  TextColumn get workout_plan_id =>
      text().references(WorkoutPlans, #id, onDelete: KeyAction.cascade)();
  IntColumn get current_week => integer().withDefault(const Constant(0))();
  IntColumn get current_day => integer().withDefault(const Constant(0))();
  @override
  Set<Column> get primaryKey => {user_id, workout_plan_id};
  @override
  BoolColumn get dirty => boolean()();
}
