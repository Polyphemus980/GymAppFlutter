import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/planned_set.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:gym_app/data/models/workout_plan.dart';
import 'package:gym_app/data/repositories/local_workout_repository.dart';
import 'package:rxdart/rxdart.dart';

class DriftWorkoutRepository implements LocalWorkoutRepository {
  final AppDatabase db;

  DriftWorkoutRepository({required this.db});
  @override
  Stream<List<WorkoutPlan>> watchWorkoutPlans(String userId) {
    final workoutPlanStream = (db.select(db.workoutPlans)
          ..where((workoutPlan) => workoutPlan.user_id.equals(userId)))
        .watch();
    return workoutPlanStream.switchMap((plans) {
      final workoutStreams = plans.map((plan) {
        return (db.select(db.plannedWorkouts)
              ..where((workout) => workout.workout_plan_id.equals(plan.id)))
            .watch()
            .map((workouts) {
          plan.workouts = workouts;
          return plan;
        });
      });
      return Rx.combineLatest(workoutStreams, (List<WorkoutPlan> updatedPlans) {
        return updatedPlans;
      });
    }).startWith([]);
  }

  @override
  Stream<List<WorkoutPlan>> watchWorkoutPlansWithDetails(String userId) {
    final workoutPlanStream = db.select(db.workoutPlans).watch();

    return workoutPlanStream.switchMap((plans) {
      final planStreams = plans.map((plan) {
        return (db.select(db.plannedWorkouts)
              ..where((workout) => workout.workout_plan_id.equals(plan.id)))
            .watch()
            .switchMap((workouts) {
          final exerciseStreams = workouts.map((workout) {
            return (db.select(db.plannedWorkoutExercises)
                  ..where((exercise) => exercise.workout_id.equals(workout.id)))
                .watch()
                .switchMap((exercises) {
              final setStreams = exercises.map((exercise) {
                return (db.select(db.plannedSets)
                      ..where(
                          (set) => set.workout_exercise_id.equals(exercise.id)))
                    .watch()
                    .map((sets) {
                  exercise.sets = sets;
                  return exercise;
                });
              });

              return Rx.combineLatest(setStreams,
                  (List<PlannedWorkoutExercise> exercisesWithSets) {
                workout.exercises = exercisesWithSets;
                return workout;
              });
            });
          });

          return Rx.combineLatest(exerciseStreams,
              (List<PlannedWorkout> workoutsWithExercises) {
            plan.workouts = workoutsWithExercises;
            return plan;
          });
        });
      });
      return Rx.combineLatest(planStreams, (List<WorkoutPlan> plansComplete) {
        return plansComplete;
      });
    }).startWith([]);
  }

  @override
  Stream<WorkoutPlan?> watchWorkoutPlanWithDetails(
      String planId, String userId) {
    final workoutPlanStream = (db.select(db.workoutPlans)
          ..where((plan) => plan.id.equals(planId)))
        .watchSingleOrNull();

    return workoutPlanStream.switchMap((plan) {
      if (plan == null) {
        return Stream.value(null); // Return null if the plan doesn't exist
      }

      final planStream = (db.select(db.plannedWorkouts)
            ..where((workout) => workout.workout_plan_id.equals(plan.id)))
          .watch()
          .switchMap((workouts) {
        final exerciseStreams = workouts.map((workout) {
          return (db.select(db.plannedWorkoutExercises)
                ..where((exercise) => exercise.workout_id.equals(workout.id)))
              .watch()
              .switchMap((exercises) {
            final setStreams = exercises.map((exercise) {
              final exerciseStream = (db.select(db.exercises)
                    ..where((ex) => ex.id.equals(exercise.exercise_id)))
                  .watchSingleOrNull();

              return exerciseStream.switchMap((exerciseDetails) {
                return (db.select(db.plannedSets)
                      ..where(
                          (set) => set.workout_exercise_id.equals(exercise.id)))
                    .watch()
                    .map((sets) {
                  exercise.sets = sets;
                  exercise.exercise = exerciseDetails;
                  return exercise;
                });
              });
            });

            return Rx.combineLatest(setStreams,
                (List<PlannedWorkoutExercise> exercisesWithSets) {
              workout.exercises = exercisesWithSets;
              return workout;
            });
          });
        });

        return Rx.combineLatest(exerciseStreams,
            (List<PlannedWorkout> workoutsWithExercises) {
          plan.workouts = workoutsWithExercises;
          return plan;
        });
      });

      return planStream;
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
