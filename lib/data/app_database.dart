import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:uuid/uuid.dart';

import 'models/completed_set.dart';
import 'models/completed_workout.dart';
import 'models/completed_workout_exercise.dart';
import 'models/exercise.dart';
import 'models/exercise_muscles.dart';
import 'models/muscle_group.dart';
import 'models/offline_user_data.dart';
import 'models/planned_set.dart';
import 'models/planned_workout.dart';
import 'models/planned_workout_exercise.dart';
import 'models/user_preferences.dart';
import 'models/user_workout_plans.dart';
import 'models/workout_plan.dart';

part 'app_database.g.dart';

typedef ExerciseWithMuscleGroups = ({
  Exercise exercise,
  List<MuscleGroup> muscleGroups,
});

@DriftDatabase(tables: [
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
  OfflineUserDataTable
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection()) {
    insertMuscleGroups();
  }

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'app.db'));

      // if (!await file.exists()) {
      //   final blob = await rootBundle.load('assets/my_database.sqlite');
      //   final buffer = blob.buffer;
      //   await file.writeAsBytes(
      //       buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
      // }

      final cachebase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cachebase;

      return NativeDatabase.createInBackground(file);
    });
  }

  Future<void> insertMuscleGroup(Insertable<MuscleGroup> muscleGroup) async {
    await into(muscleGroups).insert(muscleGroup);
  }

  Future<void> insertMuscleGroups() async {
    final result = await select(muscleGroups).get();
    if (result.isNotEmpty) {
      return;
    }
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Lats")));
    await insertMuscleGroup(
        const MuscleGroupsCompanion(name: Value("Upper Back")));
    await insertMuscleGroup(
        const MuscleGroupsCompanion(name: Value("Lower Back")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Quads")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Biceps")));
    await insertMuscleGroup(
        const MuscleGroupsCompanion(name: Value("Triceps")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Chest")));
    await insertMuscleGroup(
        const MuscleGroupsCompanion(name: Value("Front Deltoids")));
    await insertMuscleGroup(
        const MuscleGroupsCompanion(name: Value("Rear Deltoids")));
    await insertMuscleGroup(
        const MuscleGroupsCompanion(name: Value("Lateral Deltoids")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Core")));
    await insertMuscleGroup(
        const MuscleGroupsCompanion(name: Value("Forearms")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Calves")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Glutes")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Traps")));
  }
}
