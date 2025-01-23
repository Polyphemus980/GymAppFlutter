import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/exercise.dart';
import '../models/muscle_group.dart';
import 'online_exercise_repository.dart';

class SupabaseExerciseRepository implements OnlineExerciseRepository {
  final SupabaseClient supabaseClient;

  SupabaseExerciseRepository({required this.supabaseClient});
  @override
  Future<void> addExercise(String exerciseId, String userId, String name,
      String description, List<MuscleGroup> muscles) async {
    await supabaseClient
        .from('exercises')
        .insert({'id': exerciseId, 'name': name, 'description': description});
  }

  @override
  Future<void> deleteExercise(
    String exerciseId,
    String userId,
  ) async {}

  @override
  Future<List<Exercise>> getAllExercises(String userId) {
    // TODO: implement getAllExercises
    throw UnimplementedError();
  }

  @override
  Future<Exercise?> getExerciseById(String exerciseId, String userId) {
    // TODO: implement getExerciseById
    throw UnimplementedError();
  }

  @override
  Future<void> updateExercise(Exercise exercise) {
    // TODO: implement updateExercise
    throw UnimplementedError();
  }
}
