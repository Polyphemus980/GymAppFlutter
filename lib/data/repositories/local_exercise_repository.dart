import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/models/muscle_group.dart';

abstract class LocalExerciseRepository {
  Future<void> addExercise(
      String name, String description, List<MuscleGroup> muscles);
  Future<void> deleteExercise(String id);
  Future<List<Exercise>> getAllExercises();
  Future<Exercise?> getExerciseById(String id);
  Future<void> updateExercise(Exercise exercise);
  Stream<List<Exercise>> watchExercisesWithFilters(
      String query, List<MuscleGroup> groups);
  Future<List<MuscleGroup>> getAllMuscleGroups();
}
