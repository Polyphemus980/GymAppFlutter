import 'package:drift/drift.dart';
import 'package:gym_app/data/models/workout_plan.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_workout_plans.g.dart';

@JsonSerializable()
class UserWorkoutPlans {
  final String user_id;
  final String workout_plan_id;
  final bool dirty;

  UserWorkoutPlans({
    required this.user_id,
    required this.workout_plan_id,
    required this.dirty,
  });

  factory UserWorkoutPlans.fromJson(Map<String, dynamic> json) =>
      _$UserWorkoutPlansFromJson(json);
  Map<String, dynamic> toJson() => _$UserWorkoutPlansToJson(this);
}

class UserWorkoutPlansTable extends Table {
  TextColumn get user_id => text()();
  TextColumn get workout_plan_id =>
      text().references(WorkoutPlans, #id, onDelete: KeyAction.cascade)();
  BoolColumn get dirty => boolean()();

  @override
  Set<Column> get primaryKey => {user_id};
}
