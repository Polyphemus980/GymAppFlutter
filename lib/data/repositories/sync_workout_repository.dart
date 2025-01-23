import 'package:drift/drift.dart';
import 'package:gym_app/data/models/WorkoutPlanHelpers.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:gym_app/data/models/set_data.dart';
import 'package:gym_app/data/models/workout_config_set.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../app_database.dart';
import '../models/workout_plan.dart';

class SyncWorkoutRepository {
  final AppDatabase db;
  final SupabaseClient supabaseClient;
  SyncWorkoutRepository({required this.db, required this.supabaseClient});

  Future<void> addWorkoutPlanSyncSplit(
      WorkoutPlanHelper plan, String userId, bool isOnline) async {
    db.transaction(() async {
      final insertedPlan = await _insertWorkoutPlan(plan, userId, isOnline);
      if (isOnline) {
        await supabaseClient
            .from('workout_plans')
            .insert(insertedPlan.toJson());
      }
      await _insertWorkouts(plan, userId, isOnline, insertedPlan.id);
    });
  }

  Future<WorkoutPlan> _insertWorkoutPlan(
      WorkoutPlanHelper plan, String userId, bool isOnline) async {
    final insertedWorkoutPlan = await db.into(db.workoutPlans).insertReturning(
        WorkoutPlansCompanion(
            user_id: Value(userId),
            description: Value(plan.description),
            name: Value(plan.name),
            num_weeks: Value(plan.numberOfWeeks),
            days_per_week: Value(plan.daysPerWeek),
            dirty: Value(!isOnline)));
    return insertedWorkoutPlan;
  }

  Future<void> _insertWorkouts(WorkoutPlanHelper plan, String userId,
      bool isOnline, String workoutPlanId) async {
    for (var weekEntry in plan.weeks.asMap().entries) {
      for (var dayEntry in weekEntry.value.days.asMap().entries) {
        final insertedWorkout = await _insertPlannedWorkout(
            userId, isOnline, workoutPlanId, weekEntry.key, dayEntry.key);
        if (isOnline) {
          supabaseClient
              .from('planned_workouts')
              .insert(insertedWorkout.toJson());
        }
        await _insertExercisesAndSets(
            userId, isOnline, insertedWorkout.id, dayEntry.value);
      }
    }
  }

  Future<PlannedWorkout> _insertPlannedWorkout(String userId, bool isOnline,
      String workoutPlanId, int weekIndex, int dayIndex) async {
    return await db
        .into(db.plannedWorkouts)
        .insertReturning(PlannedWorkoutsCompanion(
          user_id: Value(userId),
          workout_plan_id: Value(workoutPlanId),
          day_number: Value(weekIndex),
          week_number: Value(dayIndex),
          dirty: Value(!isOnline),
        ));
  }

  Future<void> _insertExercisesAndSets(
      String userId, bool isOnline, String workoutId, WorkoutDay day) async {
    for (var setDataEntry in day.sets.asMap().entries) {
      final insertedWorkoutExercise = await _insertPlannedWorkoutExercise(
          userId, isOnline, workoutId, setDataEntry.key, setDataEntry.value);
      if (isOnline) {
        await supabaseClient
            .from('planned_workout_exercises')
            .insert(insertedWorkoutExercise.toJson());
      }
      await _insertPlannedSets(userId, isOnline, insertedWorkoutExercise.id,
          setDataEntry.value.sets);
    }
  }

  Future<PlannedWorkoutExercise> _insertPlannedWorkoutExercise(
      String userId,
      bool isOnline,
      String workoutId,
      int exerciseIndex,
      SetData setData) async {
    final insertedPlannedWorkoutExercise = await db
        .into(db.plannedWorkoutExercises)
        .insertReturning(PlannedWorkoutExercisesCompanion(
          user_id: Value(userId),
          workout_id: Value(workoutId),
          exercise_id: Value(setData.exercise.id),
          exercise_order: Value(exerciseIndex),
          dirty: Value(!isOnline),
        ));
    return insertedPlannedWorkoutExercise;
  }

  Future<void> _insertPlannedSets(String userId, bool isOnline,
      String workoutExerciseId, List<WorkoutConfigSet> sets) async {
    for (var setEntry in sets.asMap().entries) {
      final insertedPlannedSet =
          await db.into(db.plannedSets).insertReturning(PlannedSetsCompanion(
                user_id: Value(userId),
                workout_exercise_id: Value(workoutExerciseId),
                set_number: Value(setEntry.key),
                min_repetitions: Value(setEntry.value.minRepetitions!),
                max_repetitions: Value(setEntry.value.maxRepetitions!),
                rpe: Value(setEntry.value.rpe!),
                dirty: Value(!isOnline),
              ));
      if (isOnline) {
        supabaseClient.from('planned_sets').insert(insertedPlannedSet.toJson());
      }
    }
  }
}
