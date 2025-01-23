// class SupabaseExerciseRepository implements OnlineExerciseRepository{
//   final SupabaseClient supabaseClient;
//
//   SupabaseExerciseRepository({required this.supabaseClient});
//   @override
//   Future<void> addExercise(String name, String description, List<MuscleGroup> muscles) {
//      await supabaseClient.from('exercises').insert()
//   }
//
//   @override
//   Future<void> deleteExercise(int id) async {
//     final response = await supabaseClient
//         .from('exercises')
//         .delete()
//         .eq('id', id);
//
//     if (response.error != null) {
//       print('Error deleting exercise: ${response.error!.message}');
//     } else {
//       print('Exercise deleted successfully');
//     }
//   }
//
//   @override
//   Future<List<Exercise>> getAllExercises() {
//     // TODO: implement getAllExercises
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<List<MuscleGroup>> getAllMuscleGroups() {
//     // TODO: implement getAllMuscleGroups
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Exercise?> getExerciseById(int id) {
//     // TODO: implement getExerciseById
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<void> updateExercise(Exercise exercise) {
//     // TODO: implement updateExercise
//     throw UnimplementedError();
//   }
//
//   @override
//   Stream<List<Exercise>> watchExercisesWithFilters(String query, List<MuscleGroup> groups) {
//     // TODO: implement watchExercisesWithFilters
//     throw UnimplementedError();
//   }
//
// }
