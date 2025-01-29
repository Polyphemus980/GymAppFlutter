import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:uuid/uuid.dart';

import 'models/completed/completed_set.dart';
import 'models/completed/completed_workout.dart';
import 'models/completed/completed_workout_exercise.dart';
import 'models/exercise/exercise.dart';
import 'models/exercise/exercise_muscles.dart';
import 'models/exercise/muscle_group.dart';
import 'models/planned/planned_set.dart';
import 'models/planned/planned_workout.dart';
import 'models/planned/planned_workout_exercise.dart';
import 'models/user/offline_user_data.dart';
import 'models/user/user_preferences.dart';
import 'models/workout_plans/user_workout_plans.dart';
import 'models/workout_plans/workout_plan.dart';

part 'app_database.g.dart';

typedef ExerciseWithMuscleGroups = ({
  Exercise exercise,
  List<MuscleGroup> muscleGroups,
});

@DriftDatabase(
  tables: [
    PlannedWorkouts,
    CompletedWorkouts,
    WorkoutPlans,
    CompletedSets,
    Exercises,
    PlannedWorkoutExercises,
    CompletedWorkoutExercises,
    MuscleGroups,
    ExerciseMuscles,
    PlannedSets,
    UserPreferencesTable,
    UserWorkoutPlansTable,
    OfflineUserDataTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'app.db'));
      if (!file.existsSync()) {
        final blob = await rootBundle.load('assets/asset_database.db');
        final buffer = blob.buffer;
        await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes),
        );
      }

      final cachebase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cachebase;

      return NativeDatabase.createInBackground(file);
    });
  }
}
