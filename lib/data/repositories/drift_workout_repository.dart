import 'package:drift/drift.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:gym_app/data/models/user_workout_plans.dart';
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
  Stream<List<UserWorkoutPlans>> watchUserWorkoutPlans(String userId) {
    return (db.select(db.userWorkoutPlansTable)).watch().map((userPlans) {
      return Future.wait(userPlans.map((workoutPlan) async {
        workoutPlan.plan = await (db.select(db.workoutPlans)
              ..where((plan) => plan.id.equals(workoutPlan.workout_plan_id)))
            .getSingleOrNull();
        return workoutPlan;
      }));
    }).switchMap((futureList) => Stream.fromFuture(futureList));
  }

  @override
  Future<PlannedWorkout> getPlannedWorkout(UserWorkoutPlans plan) async {
    final plannedWorkout = await (db.select(db.plannedWorkouts)
          ..where(
              (workout) => workout.workout_plan_id.equals(plan.workout_plan_id))
          ..where((workout) => workout.day_number.equals(plan.current_day))
          ..where((workout) => workout.week_number.equals(plan.current_week)))
        .getSingle();
    final workoutExercises = await (db.select(db.plannedWorkoutExercises)
          ..where((workout) => workout.workout_id.equals(plannedWorkout.id)))
        .get();
    for (final workoutExercise in workoutExercises) {
      workoutExercise.sets = await (db.select(db.plannedSets)
            ..where(
                (set) => set.workout_exercise_id.equals(workoutExercise.id)))
          .get();
      final exercise = await (db.select(db.exercises)
            ..where(
                (exercise) => exercise.id.equals(workoutExercise.exercise_id)))
          .getSingle();
      final query = db.select(db.muscleGroups).join(
        [
          innerJoin(
            db.exerciseMuscles,
            db.exerciseMuscles.muscle_group_id.equalsExp(db.muscleGroups.id),
          ),
        ],
      )..where(db.exerciseMuscles.exercise_id.equals(exercise.id));

      final result = await query.get();
      exercise.muscle_groups =
          result.map((row) => row.readTable(db.muscleGroups)).toList();
      workoutExercise.exercise = exercise;
    }
    plannedWorkout.exercises = workoutExercises;
    return plannedWorkout;
  }
}
