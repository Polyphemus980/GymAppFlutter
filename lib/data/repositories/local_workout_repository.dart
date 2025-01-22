import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/planned_set.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:gym_app/data/models/workout_plan.dart';

abstract class LocalWorkoutRepository {
  Stream<List<WorkoutPlan>> watchWorkoutPlans(String userId);
  Stream<List<WorkoutPlan>> watchWorkoutPlansWithDetails(String userId);
  Stream<WorkoutPlan?> watchWorkoutPlanWithDetails(
      String planId, String userId);
  Future<void> addWorkoutPlan(WorkoutPlansCompanion plan);
  Future<WorkoutPlan> addWorkoutPlanReturning(WorkoutPlansCompanion plan);
  Future<void> addPlannedWorkout(PlannedWorkoutsCompanion plannedWorkout);
  Future<PlannedWorkout> addPlannedWorkoutReturning(
      PlannedWorkoutsCompanion plannedWorkout);
  Future<void> addPlannedWorkoutExercise(
      PlannedWorkoutExercisesCompanion plannedWorkoutExercise);
  Future<PlannedWorkoutExercise> addPlannedWorkoutExerciseReturning(
      PlannedWorkoutExercisesCompanion plannedWorkoutExercise);
  Future<void> addPlannedSet(PlannedSetsCompanion plannedSet);
  Future<PlannedSet> addPlannedSetReturning(PlannedSetsCompanion plannedSet);
}
