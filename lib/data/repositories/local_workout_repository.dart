import 'package:gym_app/data/models/workout_plan.dart';

abstract class LocalWorkoutRepository {
  Stream<List<WorkoutPlan>> getWorkoutPlans();
}
