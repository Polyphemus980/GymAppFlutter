import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqlite3/sqlite3.dart';

import 'models/exercise.dart';
import 'models/exercise_muscles.dart';
import 'models/muscle_group.dart';
import 'models/set.dart';
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
  ExerciseSets,
  Exercises,
  WorkoutExercises,
  MuscleGroups,
  ExerciseMuscles
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'app.db'));

      if (!await file.exists()) {
        final blob = await rootBundle.load('assets/my_database.sqlite');
        final buffer = blob.buffer;
        await file.writeAsBytes(
            buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
      }

      final cachebase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cachebase;

      return NativeDatabase.createInBackground(file);
    });
  }

  Future<void> insertExercise(Insertable<Exercise> exercise) async {
    await into(exercises).insert(exercise);
  }

  Stream<List<Exercise>> getExercises() {
    final exerciseStream = select(exercises).watch();
    return exerciseStream.switchMap((exercises) {
      final idToExercise = {
        for (var exercise in exercises) exercise.id: exercise
      };
      final ids = idToExercise.keys;
      final muscleQuery = select(exerciseMuscles).join(
        [
          innerJoin(muscleGroups,
              muscleGroups.id.equalsExp(exerciseMuscles.muscleGroupId))
        ],
      )..where(exerciseMuscles.exerciseId.isIn(ids));
      return muscleQuery.watch().map((rows) {
        final idToMuscles = <int, List<MuscleGroup>>{};
        for (final row in rows) {
          final item = row.readTable(muscleGroups);
          final id = row.readTable(exerciseMuscles).exerciseId;

          idToMuscles.putIfAbsent(id, () => []).add(item);
        }
        final exerciseList = <Exercise>[];
        for (var id in ids) {
          final exercise = idToExercise[id]!;
          exercise.muscleGroups = idToMuscles[id]!;
          exerciseList.add(exercise);
        }
        return exerciseList;
      });
    });
  }

  Stream<List<Exercise>> getExercisesWithFilters(
      String query, List<MuscleGroup> groups) {
    final exerciseStream = (select(exercises)
          ..where((exercise) =>
              exercise.name.lower().contains(query.toLowerCase())))
        .watch();
    return exerciseStream.switchMap((exercises) {
      final idToExercise = {
        for (var exercise in exercises) exercise.id: exercise
      };
      final ids = idToExercise.keys;
      final muscleQuery = (select(exerciseMuscles)).join(
        [
          innerJoin(muscleGroups,
              muscleGroups.id.equalsExp(exerciseMuscles.muscleGroupId))
        ],
      )..where(exerciseMuscles.exerciseId.isIn(ids));
      return muscleQuery.watch().map((rows) {
        final idToMuscles = <int, List<MuscleGroup>>{};
        for (final row in rows) {
          final item = row.readTable(muscleGroups);
          final id = row.readTable(exerciseMuscles).exerciseId;

          idToMuscles.putIfAbsent(id, () => []).add(item);
        }

        final exerciseList = <Exercise>[];
        for (var id in ids) {
          if (idToMuscles.containsKey(id) &&
              idToMuscles[id]!.toSet().containsAll(groups.toSet())) {
            final exercise = idToExercise[id]!;
            exercise.muscleGroups = idToMuscles[id]!;
            exerciseList.add(exercise);
          }
        }
        return exerciseList;
      });
    });
  }
}
