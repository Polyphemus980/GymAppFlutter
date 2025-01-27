import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/core/domain/sets/set_data.dart';
import 'package:gym_app/core/domain/sets/workout_config_set.dart';
import 'package:gym_app/core/domain/workouts/workout_plan_helpers.dart';
import 'package:gym_app/data/models/planned/planned_workout.dart';
import 'package:gym_app/data/models/planned/planned_workout_exercise.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../app_database.dart';
import '../../models/workout_plans/workout_plan.dart';

class SyncWorkoutRepository {
  final AppDatabase db;
  final SupabaseClient supabaseClient;
  SyncWorkoutRepository({required this.db, required this.supabaseClient});

  Future<void> addWorkoutPlanSyncSplit(
      WorkoutPlanHelper plan, String userId, bool isOnline) async {
    bool stopSupabaseInserting = false;

    db.transaction(() async {
      final insertedPlan = await _insertWorkoutPlan(plan, userId, isOnline);

      if (isOnline && !stopSupabaseInserting) {
        try {
          await supabaseClient
              .from('workout_plans')
              .insert(insertedPlan.toJson());
        } catch (err) {
          stopSupabaseInserting = true;
          debugPrint("$err");
          await (db.update(db.workoutPlans)
                ..where((wp) => wp.id.equals(insertedPlan.id)))
              .write(const WorkoutPlansCompanion(dirty: Value(true)));
        }
      }
      await _insertWorkouts(
          plan, userId, isOnline, insertedPlan.id, stopSupabaseInserting);
    }).timeout(const Duration(seconds: 10), onTimeout: () {
      debugPrint("Timeout \n");
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
      bool isOnline, String workoutPlanId, bool stopSupabaseInserting) async {
    for (var weekEntry in plan.weeks.asMap().entries) {
      for (var dayEntry in weekEntry.value.days.asMap().entries) {
        final insertedWorkout = await _insertPlannedWorkout(userId, isOnline,
            workoutPlanId, weekEntry.key, dayEntry.key, stopSupabaseInserting);
        if (isOnline && !stopSupabaseInserting) {
          try {
            await supabaseClient
                .from('planned_workouts')
                .insert(insertedWorkout.toJson());
          } catch (e) {
            stopSupabaseInserting = true;
            debugPrint("$e");
            await (db.update(db.workoutPlans)
                  ..where((wp) => wp.id.equals(insertedWorkout.id)))
                .write(const WorkoutPlansCompanion(dirty: Value(true)));
          }
        }
        await _insertExercisesAndSets(userId, isOnline, insertedWorkout.id,
            dayEntry.value, stopSupabaseInserting);
      }
    }
  }

  Future<PlannedWorkout> _insertPlannedWorkout(
      String userId,
      bool isOnline,
      String workoutPlanId,
      int weekIndex,
      int dayIndex,
      bool stopSupabaseInserting) async {
    return await db
        .into(db.plannedWorkouts)
        .insertReturning(PlannedWorkoutsCompanion(
          user_id: Value(userId),
          workout_plan_id: Value(workoutPlanId),
          day_number: Value(dayIndex),
          week_number: Value(weekIndex),
          dirty: Value(!isOnline || stopSupabaseInserting),
        ));
  }

  Future<void> _insertExercisesAndSets(String userId, bool isOnline,
      String workoutId, WorkoutDay day, bool stopSupabaseInserting) async {
    for (final setDataEntry in day.sets.asMap().entries) {
      final insertedWorkoutExercise = await _insertPlannedWorkoutExercise(
          userId,
          isOnline,
          workoutId,
          setDataEntry.key,
          setDataEntry.value,
          stopSupabaseInserting);

      if (isOnline && !stopSupabaseInserting) {
        try {
          await supabaseClient
              .from('planned_workout_exercises')
              .insert(insertedWorkoutExercise.toJson());
        } catch (err) {
          stopSupabaseInserting = true;
          debugPrint("$err");
          await (db.update(db.plannedWorkoutExercises)
                ..where((wp) => wp.id.equals(insertedWorkoutExercise.id)))
              .write(
                  const PlannedWorkoutExercisesCompanion(dirty: Value(true)));
        }
      }
      await _insertPlannedSets(userId, isOnline, insertedWorkoutExercise.id,
          setDataEntry.value.sets, stopSupabaseInserting);
    }
  }

  Future<PlannedWorkoutExercise> _insertPlannedWorkoutExercise(
      String userId,
      bool isOnline,
      String workoutId,
      int exerciseIndex,
      SetData setData,
      bool stopSupabaseInserting) async {
    final insertedPlannedWorkoutExercise = await db
        .into(db.plannedWorkoutExercises)
        .insertReturning(PlannedWorkoutExercisesCompanion(
          user_id: Value(userId),
          workout_id: Value(workoutId),
          exercise_id: Value(setData.exercise.id),
          exercise_order: Value(exerciseIndex),
          dirty: Value(
            !isOnline || stopSupabaseInserting,
          ),
        ));
    return insertedPlannedWorkoutExercise;
  }

  Future<void> _insertPlannedSets(
      String userId,
      bool isOnline,
      String workoutExerciseId,
      List<WorkoutConfigSet> sets,
      bool stopSupabaseInserting) async {
    for (final setEntry in sets.asMap().entries) {
      final insertedPlannedSet =
          await db.into(db.plannedSets).insertReturning(PlannedSetsCompanion(
                user_id: Value(userId),
                workout_exercise_id: Value(workoutExerciseId),
                set_number: Value(setEntry.key),
                min_repetitions: Value(setEntry.value.minRepetitions!),
                max_repetitions: Value(setEntry.value.maxRepetitions!),
                rpe: Value(setEntry.value.rpe!),
                dirty: Value(!isOnline || stopSupabaseInserting),
              ));
      if (isOnline && !stopSupabaseInserting) {
        try {
          await supabaseClient
              .from('planned_sets')
              .insert(insertedPlannedSet.toJson());
        } catch (err) {
          stopSupabaseInserting = true;
          debugPrint("$err");
          await (db.update(db.plannedSets)
                ..where((wp) => wp.id.equals(insertedPlannedSet.id)))
              .write(const PlannedSetsCompanion(dirty: Value(true)));
        }
      }
    }
  }

  Future<void> signUserUpForWorkoutPlan(
      String userId, String planId, bool isOnline) async {
    final insertedUserWorkoutPlan = await db
        .into(db.userWorkoutPlansTable)
        .insertReturning(UserWorkoutPlansTableCompanion(
          user_id: Value(userId),
          workout_plan_id: Value(planId),
          dirty: Value(!isOnline),
        ));
    if (isOnline) {
      try {
        await supabaseClient
            .from('user_workout_plans')
            .insert(insertedUserWorkoutPlan.toJson());
      } catch (err) {
        (db.update(db.userWorkoutPlansTable)
              ..where((uwp) => uwp.user_id.equals(userId))
              ..where((uwp) => uwp.workout_plan_id.equals(planId)))
            .write(const UserWorkoutPlansTableCompanion(dirty: Value(true)));
      }
    }
  }

  Future<void> addCompletedWorkoutSplit(
      List<SetData> exerciseSets,
      String userId,
      bool isOnline,
      String? plannedWorkoutId,
      bool isMetric) async {
    bool stopSupabaseInserting = false;
    db.transaction(() async {
      if (plannedWorkoutId != null) {
        final plannedWorkout = await (db.select(db.plannedWorkouts)
              ..where((pw) => pw.id.equals(plannedWorkoutId)))
            .getSingle();
        final userPlan = await (db.select(db.userWorkoutPlansTable)
              ..where((pw) =>
                  pw.workout_plan_id.equals(plannedWorkout.workout_plan_id)))
            .getSingle();
        final workoutPlan = await (db.select(db.workoutPlans)
              ..where((pw) => pw.id.equals(plannedWorkout.workout_plan_id)))
            .getSingle();
        final day = (userPlan.current_day + 1) % workoutPlan.days_per_week;
        final week = userPlan.current_week +
            ((userPlan.current_day + 1) ~/ workoutPlan.days_per_week);
        if (week == workoutPlan.num_weeks) {
          await (db.delete(db.userWorkoutPlansTable)
                ..where((plan) => plan.workout_plan_id.equals(workoutPlan.id)))
              .go();
          if (isOnline) {
            try {
              await supabaseClient
                  .from('user_workout_plans')
                  .delete()
                  .eq('workout_plan_id', workoutPlan.id);
            } catch (err) {
              debugPrint("$err");
            }
          }
        } else {
          await (db.update(db.userWorkoutPlansTable)
                ..where((plan) => plan.workout_plan_id.equals(workoutPlan.id)))
              .write(UserWorkoutPlansTableCompanion(
                  dirty: Value(!isOnline),
                  current_day: Value(day),
                  current_week: Value(week)));
          if (isOnline) {
            try {
              await supabaseClient
                  .from('user_workout_plans')
                  .update({'current_day': day, 'current_week': week}).eq(
                      'workout_plan_id', workoutPlan.id);
            } catch (err) {
              stopSupabaseInserting = true;
              debugPrint("$err");
              await (db.update(db.userWorkoutPlansTable)
                    ..where(
                        (plan) => plan.workout_plan_id.equals(workoutPlan.id)))
                  .write(const UserWorkoutPlansTableCompanion(
                dirty: Value(true),
              ));
            }
          }
        }
      }
      final insertedWorkout = await db
          .into(db.completedWorkouts)
          .insertReturning(CompletedWorkoutsCompanion(
            dirty: Value(!isOnline),
            workout_date: Value(DateTime.now()),
            planned_workout_id: Value(plannedWorkoutId),
            user_id: Value(userId),
            end_time: Value(DateTime.now()),
          ));
      if (isOnline && !stopSupabaseInserting) {
        try {
          await supabaseClient
              .from('completed_workouts')
              .insert(insertedWorkout.toJson());
        } catch (err) {
          stopSupabaseInserting = true;
          debugPrint("$err");
          await (db.update(db.completedWorkouts)
                ..where((wp) => wp.id.equals(insertedWorkout.id)))
              .write(
            const CompletedWorkoutsCompanion(
              dirty: Value(true),
            ),
          );
        }
      }
      await _insertCompletedExercisesAndSets(exerciseSets, userId, isOnline,
          insertedWorkout.id, stopSupabaseInserting, isMetric);
    });
  }

  Future<void> _insertCompletedExercisesAndSets(
      List<SetData> exerciseSets,
      String userId,
      bool isOnline,
      String workoutId,
      bool stopSupabaseInserting,
      bool isMetric) async {
    for (final exerciseSet in exerciseSets.asMap().entries) {
      final insertedWorkoutExercise =
          await db.into(db.completedWorkoutExercises).insertReturning(
                CompletedWorkoutExercisesCompanion(
                    user_id: Value(userId),
                    exercise_id: Value(exerciseSet.value.exercise.id),
                    workout_id: Value(workoutId),
                    exercise_order: Value(exerciseSet.key),
                    dirty: Value(!isOnline || stopSupabaseInserting)),
              );
      if (isOnline && !stopSupabaseInserting) {
        try {
          await supabaseClient
              .from('completed_workout_exercises')
              .insert(insertedWorkoutExercise.toJson());
        } catch (err) {
          stopSupabaseInserting = true;
          debugPrint("$err");
          await (db.update(db.completedWorkoutExercises)
                ..where((wp) => wp.id.equals(insertedWorkoutExercise.id)))
              .write(
                  const CompletedWorkoutExercisesCompanion(dirty: Value(true)));
        }
      }
      await _insertCompleteSets(userId, isOnline, insertedWorkoutExercise.id,
          exerciseSet.value.sets, stopSupabaseInserting, isMetric);
    }
  }

  Future<void> _insertCompleteSets(
      String userId,
      bool isOnline,
      String workoutExerciseId,
      List<WorkoutConfigSet> sets,
      bool stopSupabaseInserting,
      bool isMetric) async {
    for (final setEntry in sets.asMap().entries) {
      final insertedCompletedSet =
          await db.into(db.completedSets).insertReturning(
                CompletedSetsCompanion(
                  user_id: Value(userId),
                  workout_exercise_id: Value(workoutExerciseId),
                  set_number: Value(setEntry.key),
                  repetitions: Value(setEntry.value.repetitions ?? 0),
                  weight: Value(setEntry.value.weight ?? 0),
                  duration_seconds: Value(setEntry.value.duration),
                  dirty: Value(!isOnline || stopSupabaseInserting),
                  is_metric: Value(isMetric),
                ),
              );
      if (isOnline && !stopSupabaseInserting) {
        try {
          await supabaseClient
              .from('completed_sets')
              .insert(insertedCompletedSet.toJson());
        } catch (err) {
          stopSupabaseInserting = true;
          debugPrint("$err");
          await (db.update(db.completedSets)
                ..where((wp) => wp.id.equals(insertedCompletedSet.id)))
              .write(const CompletedSetsCompanion(dirty: Value(true)));
        }
      }
    }
  }
}
