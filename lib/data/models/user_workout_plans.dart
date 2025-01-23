import 'package:drift/drift.dart';
import 'package:gym_app/data/models/workout_plan.dart';

class UserWorkoutPlans {
  final String userId;
  final String workoutPlanId;
  final bool dirty;
  UserWorkoutPlans(
      {required this.userId, required this.workoutPlanId, required this.dirty});
}

class UserWorkoutPlansTable extends Table {
  TextColumn get userId => text()();
  TextColumn get workoutPlanId =>
      text().references(WorkoutPlans, #id, onDelete: KeyAction.cascade)();
  BoolColumn get dirty => boolean()();
}
