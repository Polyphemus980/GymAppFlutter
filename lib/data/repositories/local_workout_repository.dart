import 'package:gym_app/data/models/workout_plan.dart';

abstract class LocalWorkoutRepository {
  Stream<List<WorkoutPlan>> watchWorkoutPlans(String userId);
  Stream<List<WorkoutPlan>> watchWorkoutPlansWithDetails(String userId);
  Stream<WorkoutPlan?> watchWorkoutPlanWithDetails(
      String planId, String userId);
}
