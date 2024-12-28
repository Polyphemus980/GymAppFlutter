import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

import 'models/exercise.dart';
import 'models/exercise_muscles.dart';
import 'models/muscle_group.dart';
import 'models/sets.dart';
import 'models/workout.dart';
import 'models/workout_exercise.dart';
import 'models/workout_plan.dart';

part 'app_database.g.dart';

typedef ExerciseWithMuscleGroups = ({
  Exercise exercise,
  List<MuscleGroup> muscleGroups,
});

@DriftDatabase(tables: [
  Workouts,
  WorkoutPlans,
  CompleteSets,
  Exercises,
  WorkoutExercises,
  MuscleGroups,
  ExerciseMuscles,
  PlannedSets
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

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

  Future<void> insertExerciseMuscles(
      List<MuscleGroup> muscles, int exerciseId) async {
    for (final muscle in muscles) {
      await into(exerciseMuscles).insert(ExerciseMusclesCompanion(
          exerciseId: Value(exerciseId), muscleGroupId: Value(muscle.id)));
    }
  }
}
