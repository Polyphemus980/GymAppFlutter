import '../models/exercise.dart';
import '../models/muscle_group.dart';

abstract class OnlineExerciseRepository {
  Future<void> addExercise(String exerciseId, String userId, String name,
      String description, List<MuscleGroup> muscles);
  Future<void> deleteExercise(String exerciseId, String userId);
  Future<List<Exercise>> getAllExercises(String userId);
  Future<Exercise?> getExerciseById(String exerciseId, String userId);
  Future<void> updateExercise(Exercise exercise);
}
