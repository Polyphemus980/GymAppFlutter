import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/exercise.dart';
import 'tables/exercise_muscles.dart';
import 'tables/muscle_group.dart';
import 'tables/set.dart';
import 'tables/workout.dart';
import 'tables/workout_exercise.dart';
import 'tables/workout_plan.dart';

part 'app_database.g.dart';

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

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }

  Future<void> insertExercise(Insertable<Exercise> exercise) async {
    await into(exercises).insert(exercise);
  }

  Future<void> insertExerciseMuscles(
      List<MuscleGroup> muscles, int exerciseId) async {
    for (final muscle in muscles) {
      await into(exerciseMuscles).insert(ExerciseMusclesCompanion(
          exerciseId: Value(exerciseId), muscleGroupId: Value(muscle.id)));
    }

  }

  Future<void> insertMuscleGroup(Insertable<MuscleGroup> muscleGroup) async {
    await into(muscleGroups).insert(muscleGroup);
  }

  Future<void> insertMuscleGroups() async {
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Back")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Legs")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Biceps")));
    await insertMuscleGroup(
        const MuscleGroupsCompanion(name: Value("Triceps")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Chest")));
    await insertMuscleGroup(
        const MuscleGroupsCompanion(name: Value("Shoulders")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Abs")));
    await insertMuscleGroup(
        const MuscleGroupsCompanion(name: Value("Forearms")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Calves")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Glutes")));
    await insertMuscleGroup(const MuscleGroupsCompanion(name: Value("Traps")));
  }
}
