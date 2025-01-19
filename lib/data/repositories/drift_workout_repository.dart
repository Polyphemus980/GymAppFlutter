import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/planned_set.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:gym_app/data/models/workout_plan.dart';
import 'package:gym_app/data/repositories/local_workout_repository.dart';
import 'package:rxdart/rxdart.dart';

class DriftWorkoutRepository extends LocalWorkoutRepository {
  final AppDatabase db;

  DriftWorkoutRepository({required this.db});
  @override
  Stream<List<WorkoutPlan>> watchWorkoutPlans() {
    final workoutPlanStream = db.select(db.workoutPlans).watch();
    return workoutPlanStream.switchMap((plans) {
      final workoutStreams = plans.map((plan) {
        return (db.select(db.plannedWorkouts)
              ..where((workout) => workout.workoutPlanId.equals(plan.id)))
            .watch()
            .map((workouts) {
          plan.workouts = workouts;
          return plan;
        });
      });
      return Rx.combineLatest(workoutStreams, (List<WorkoutPlan> updatedPlans) {
        return updatedPlans;
      });
    });
  }

  @override
  Future<void> addWorkoutPlan(WorkoutPlansCompanion plan) async {
    await db.into(db.workoutPlans).insert(plan);
  }

  @override
  Future<WorkoutPlan> addWorkoutPlanReturning(
      WorkoutPlansCompanion plan) async {
    final insertedPlan = await db.into(db.workoutPlans).insertReturning(plan);
    return insertedPlan;
  }

  @override
  Future<void> addPlannedWorkout(
      PlannedWorkoutsCompanion plannedWorkout) async {
    await db.into(db.plannedWorkouts).insert(plannedWorkout);
  }

  @override
  Future<PlannedWorkout> addPlannedWorkoutReturning(
      PlannedWorkoutsCompanion plannedWorkout) async {
    final insertedWorkout =
        await db.into(db.plannedWorkouts).insertReturning(plannedWorkout);
    return insertedWorkout;
  }

  @override
  Future<void> addPlannedWorkoutExercise(
      PlannedWorkoutExercisesCompanion plannedWorkoutExercise) async {
    await db.into(db.plannedWorkoutExercises).insert(plannedWorkoutExercise);
  }

  @override
  Future<PlannedWorkoutExercise> addPlannedWorkoutExerciseReturning(
      PlannedWorkoutExercisesCompanion plannedWorkoutExercise) async {
    final insertedWorkoutExercise = await db
        .into(db.plannedWorkoutExercises)
        .insertReturning(plannedWorkoutExercise);
    return insertedWorkoutExercise;
  }

  @override
  Future<void> addPlannedSet(PlannedSetsCompanion plannedSet) async {
    await db.into(db.plannedSets).insert(plannedSet);
  }

  @override
  Future<PlannedSet> addPlannedSetReturning(
      PlannedSetsCompanion plannedSet) async {
    final insertedSet =
        await db.into(db.plannedSets).insertReturning(plannedSet);
    return insertedSet;
  }
}
