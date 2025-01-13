import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/workout_plan.dart';
import 'package:gym_app/data/repositories/local_workout_repository.dart';

class DriftWorkoutRepository extends LocalWorkoutRepository {
  final AppDatabase db;

  DriftWorkoutRepository({required this.db});
  @override
  Stream<List<WorkoutPlan>> getWorkoutPlans() {
    final workoutPlanStream = db.select(db.workoutPlans).watch();

    return workoutPlanStream;
  }
}
