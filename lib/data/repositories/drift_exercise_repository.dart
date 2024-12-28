import 'package:drift/drift.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/models/muscle_group.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
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
      List<MuscleGroup> muscles, int exerciseId) async {
    for (final muscle in muscles) {
      await db.into(db.exerciseMuscles).insert(ExerciseMusclesCompanion(
          exerciseId: Value(exerciseId), muscleGroupId: Value(muscle.id)));
    }
  }

  @override
  Future<void> deleteExercise(int id) async {
    await (db.delete(db.exercises)..where((exercise) => exercise.id.equals(id)))
        .go();
  }

  @override
  Future<List<Exercise>> getAllExercises() async {
    final exercises = await db.select(db.exercises).get();
    return exercises;
  }

  @override
  Future<Exercise?> getExerciseById(int id) async {
    final exercise = await (db.select(db.exercises)
          ..where((exercise) => exercise.id.equals(id)))
        .getSingleOrNull();
    return exercise;
  }

  @override
  Future<void> updateExercise(Exercise exercise) async {
    await db.update(db.exercises).replace(ExercisesCompanion(
          id: Value(exercise.id),
          name: Value(exercise.name),
          description: Value(exercise.description),
          createdAt: Value(exercise.createdAt),
          updatedAt: Value(DateTime.now()),
        ));
  }

  @override
  Stream<List<Exercise>> getExercisesWithFilters(
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
              db.muscleGroups.id.equalsExp(db.exerciseMuscles.muscleGroupId))
        ],
      )..where(db.exerciseMuscles.exerciseId.isIn(ids));
      return muscleQuery.watch().map((rows) {
        final idToMuscles = <int, List<MuscleGroup>>{};
        for (final row in rows) {
          final item = row.readTable(db.muscleGroups);
          final id = row.readTable(db.exerciseMuscles).exerciseId;

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

  @override
  Future<List<MuscleGroup>> getAllMuscleGroups() async {
    final muscleList = db.select(db.muscleGroups).get();
    return muscleList;
  }
}
