import 'package:drift/drift.dart';
import 'package:gym_app/data/models/workout_plan.dart';

class UserWorkoutPlans {
  final String userId;
  final String workoutPlanId;

  UserWorkoutPlans({required this.userId, required this.workoutPlanId});
}

class UserWorkoutPlansTable extends Table {
  TextColumn get userId => text()();
  TextColumn get workoutPlanId =>
      text().references(WorkoutPlans, #id, onDelete: KeyAction.cascade)();
}
