import 'package:gym_app/data/models/planned_workout.dart';
import 'package:gym_app/data/models/user_workout_plans.dart';
import 'package:gym_app/data/models/workout_plan.dart';

abstract class LocalWorkoutRepository {
  Stream<List<WorkoutPlan>> watchWorkoutPlans(String userId);
  Stream<List<WorkoutPlan>> watchWorkoutPlansWithDetails(String userId);
  Stream<WorkoutPlan?> watchWorkoutPlanWithDetails(
      String planId, String userId);
  Stream<List<UserWorkoutPlans>> watchUserWorkoutPlans(String userId);
  Future<PlannedWorkout> getPlannedWorkout(UserWorkoutPlans plan);
}
