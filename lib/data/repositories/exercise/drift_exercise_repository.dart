import 'package:drift/drift.dart';
import 'package:gym_app/core/domain/exercises/exercise_with_sets.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/completed/completed_set.dart';
import 'package:gym_app/data/models/exercise/exercise.dart';
import 'package:gym_app/data/models/exercise/muscle_group.dart';
import 'package:gym_app/data/repositories/exercise/local_exercise_repository.dart';
import 'package:rxdart/rxdart.dart';

class DriftExerciseRepository implements LocalExerciseRepository {
  final AppDatabase db;
  DriftExerciseRepository({required this.db});
  @override
  Future<void> addExercise(
      String name, String description, List<MuscleGroup> muscles) async {
    ExercisesCompanion exerciseCompanion =
        ExercisesCompanion(name: Value(name), description: Value(description));
    final exercise =
        await db.into(db.exercises).insertReturning(exerciseCompanion);
    await _insertExerciseMuscles(muscles, exercise.id);
  }

  Future<void> _insertExerciseMuscles(
      List<MuscleGroup> muscles, String exerciseId) async {
    for (final muscle in muscles) {
      await db.into(db.exerciseMuscles).insert(ExerciseMusclesCompanion(
          exercise_id: Value(exerciseId), muscle_group_id: Value(muscle.id)));
    }
  }

  @override
  Future<void> deleteExercise(String id) async {
    await (db.delete(db.exercises)..where((exercise) => exercise.id.equals(id)))
        .go();
  }

  @override
  Stream<List<Exercise>> watchExercisesWithFilters(
      String query, List<MuscleGroup> groups) {
    final exerciseStream = (db.select(db.exercises)
          ..where((exercise) =>
              exercise.name.lower().contains(query.toLowerCase())))
        .watch();
    return exerciseStream.switchMap((exercises) {
      final idToExercise = {
        for (var exercise in exercises) exercise.id: exercise
      };
      final ids = idToExercise.keys;
      final muscleQuery = (db.select(db.exerciseMuscles)).join(
        [
          innerJoin(db.muscleGroups,
              db.muscleGroups.id.equalsExp(db.exerciseMuscles.muscle_group_id))
        ],
      )..where(db.exerciseMuscles.exercise_id.isIn(ids));
      return muscleQuery.watch().map((rows) {
        final idToMuscles = <String, List<MuscleGroup>>{};
        for (final row in rows) {
          final item = row.readTable(db.muscleGroups);
          final id = row.readTable(db.exerciseMuscles).exercise_id;

          idToMuscles.putIfAbsent(id, () => []).add(item);
        }

        final exerciseList = <Exercise>[];
        for (var id in ids) {
          if (idToMuscles.containsKey(id) &&
              idToMuscles[id]!.toSet().containsAll(groups.toSet())) {
            final exercise = idToExercise[id]!;
            exercise.muscle_groups = idToMuscles[id]!;
            exerciseList.add(exercise);
          }
        }
        return exerciseList;
      });
    });
  }

  @override
  Future<List<MuscleGroup>> getAllMuscleGroups() async {
    final muscleList = db.select(db.muscleGroups).get();
    return muscleList;
  }

  @override
  Future<Exercise> getExercise(String exerciseId) async {
    final exercise = await (db.select(db.exercises)
          ..where((ex) => ex.id.equals(exerciseId)))
        .getSingle();
    final query = db.select(db.muscleGroups).join([
      innerJoin(db.exerciseMuscles,
          db.exerciseMuscles.muscle_group_id.equalsExp(db.muscleGroups.id),
          useColumns: false)
    ])
      ..where(db.exerciseMuscles.exercise_id.equals(exerciseId));
    final muscleGroupsRows = await query.get();
    final muscleGroups = muscleGroupsRows.map((row) {
      return MuscleGroup(
          id: row.readTable(db.muscleGroups).id,
          name: row.readTable(db.muscleGroups).name);
    }).toList();
    exercise.muscle_groups = muscleGroups;
    return exercise;
  }

  @override
  Future<List<CompletedSet>> getLastCompletedSets(
      String exerciseId, int numSets) async {
    final query = db.select(db.completedSets).join([
      innerJoin(
          db.completedWorkoutExercises,
          db.completedWorkoutExercises.id
              .equalsExp(db.completedSets.workout_exercise_id),
          useColumns: false)
    ])
      ..where(db.completedWorkoutExercises.exercise_id.equals(exerciseId))
      ..orderBy([OrderingTerm.desc(db.completedSets.created_at)])
      ..limit(5);
    final lastSets = await query.get();
    final completedSetsList = lastSets.map((row) {
      return CompletedSet(
        id: row.readTable(db.completedSets).id,
        user_id: row.readTable(db.completedSets).user_id,
        workout_exercise_id:
            row.readTable(db.completedSets).workout_exercise_id,
        set_number: row.readTable(db.completedSets).set_number,
        repetitions: row.readTable(db.completedSets).repetitions,
        duration_seconds: row.readTable(db.completedSets).duration_seconds,
        weight: row.readTable(db.completedSets).weight,
        created_at: row.readTable(db.completedSets).created_at,
        updated_at: row.readTable(db.completedSets).updated_at,
        dirty: row.readTable(db.completedSets).dirty,
        is_metric: row.readTable(db.completedSets).is_metric,
      );
    }).toList();
    return completedSetsList;
  }

  @override
  Future<ExerciseWithSets> getExerciseWithSets(String exerciseId) async {
    final exercise = await getExercise(exerciseId);
    final sets = await getLastCompletedSets(exerciseId, 5);
    return ExerciseWithSets(exercise: exercise, sets: sets);
  }
}
