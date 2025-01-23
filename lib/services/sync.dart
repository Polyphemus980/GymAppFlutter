import 'package:drift/drift.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/database_helpers.dart';
import 'package:gym_app/data/models/completed_set.dart';
import 'package:gym_app/data/models/completed_workout.dart';
import 'package:gym_app/data/models/completed_workout_exercise.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/models/planned_set.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:gym_app/data/models/user_preferences.dart';
import 'package:gym_app/data/models/user_workout_plans.dart';
import 'package:gym_app/data/models/workout_plan.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/models/dirty_table.dart';

class SynchronizationCenter {
  final SupabaseClient supabaseClient;
  final AppDatabase db;

  SynchronizationCenter({required this.supabaseClient, required this.db}) {
    tableToDaoMap = {
      'completed_sets': db.completedSets,
      'completed_workouts': db.completedWorkouts,
      'completed_workout_exercises': db.completedWorkoutExercises,
      'exercises': db.exercises,
      'exercise_muscles': db.exerciseMuscles,
      'planned_sets': db.plannedSets,
      'planned_workouts': db.plannedWorkouts,
      'planned_workout_exercises': db.plannedWorkoutExercises,
      'user_preferences': db.userPreferencesTable,
      'user_workout_plans': db.userWorkoutPlansTable,
      'workout_plans': db.workoutPlans,
    };
    tableToInsertableMethods = {
      'completed_sets': (json) {
        final set = CompletedSet.fromJson(json);
        return toCompletedSetCompanion(set);
      },
      'completed_workouts': (json) {
        final workout = CompletedWorkout.fromJson(json);
        return toCompletedWorkoutCompanion(workout);
      },
      'completed_workout_exercises': (json) {
        final exercise = CompletedWorkoutExercise.fromJson(json);
        return toCompletedWorkoutExerciseCompanion(exercise);
      },
      'exercises': (json) {
        final exercise = Exercise.fromJson(json);
        return toExerciseCompanion(exercise);
      },
      'exercise_muscles': (json) {
        final exerciseMuscle = ExerciseMuscle.fromJson(json);
        return toExerciseMuscleCompanion(exerciseMuscle);
      },
      'planned_sets': (json) {
        final plannedSet = PlannedSet.fromJson(json);
        return toPlannedSetCompanion(plannedSet);
      },
      'planned_workouts': (json) {
        final plannedWorkout = PlannedWorkout.fromJson(json);
        return toPlannedWorkoutCompanion(plannedWorkout);
      },
      'planned_workout_exercises': (json) {
        final plannedWorkoutExercise = PlannedWorkoutExercise.fromJson(json);
        return toPlannedWorkoutExerciseCompanion(plannedWorkoutExercise);
      },
      'user_preferences': (json) {
        final userPreferences = UserPreferences.fromJson(json);
        return toUserPreferencesCompanion(userPreferences);
      },
      'user_workout_plans': (json) {
        final userWorkoutPlans = UserWorkoutPlans.fromJson(json);
        return toUserWorkoutPlansCompanion(userWorkoutPlans);
      },
      'workout_plans': (json) {
        final workoutPlan = WorkoutPlan.fromJson(json);
        return toWorkoutPlanCompanion(workoutPlan);
      },
    };
  }

  final tables = [
    'completed_sets',
    'completed_workouts',
    'completed_workout_exercises',
    'exercises',
    'exercise_muscles',
    'planned_sets',
    'planned_workouts',
    'planned_workout_exercises',
    'user_preferences',
    'user_workout_plans',
    'workout_plans',
  ];

  late Map<String, dynamic> tableToDaoMap;
  late Map<String, Insertable<dynamic> Function(Map<String, dynamic>)>
      tableToInsertableMethods;

  Future<void> syncFromRemoteToLocal(DateTime lastSynced) async {
    for (final table in tables) {
      final rows = await supabaseClient.from(table).select();
      //.gt('updated_at', lastSynced);

      if (rows.isNotEmpty) {
        final rowCompanions =
            rows.map((row) => tableToInsertableMethods[table]!(row)).toList();
        await db.batch((batch) {
          batch.insertAllOnConflictUpdate(tableToDaoMap[table], rowCompanions);
        });
      }
    }
  }

  Future<void> syncFromLocalToRemote() async {
    for (final table in tables) {
      final dirtyRecords = await (db.select(tableToDaoMap[table])
            ..where((tbl) {
              final dirtyColumn = (tbl as DirtyTable).dirty;
              return dirtyColumn.equals(true);
            }))
          .get();
      final dirtyRecordsJson =
          dirtyRecords.map((record) => record.toJson()).toList();
      await supabaseClient.from(table).upsert(dirtyRecordsJson);
    }
  }
}
