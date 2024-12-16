import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:gym_app/data/tables/exercise.dart';
import 'package:gym_app/data/tables/muscle_group.dart';
import 'package:gym_app/data/tables/set.dart';
import 'package:gym_app/data/tables/workout.dart';
import 'package:gym_app/data/tables/workout_exercise.dart';
import 'package:gym_app/data/tables/workout_plan.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Workouts,
  WorkoutPlans,
  ExerciseSets,
  Exercises,
  WorkoutExercises,
  MuscleGroups
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }

  Future<void> insertExercise(Insertable<Exercise> exercise) async {
    await into(exercises).insert(exercise);
  }
}
