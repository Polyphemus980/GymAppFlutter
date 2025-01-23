import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/muscle_group.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SyncExerciseRepository {
  final AppDatabase db;
  final SupabaseClient supabaseClient;
  SyncExerciseRepository({required this.db, required this.supabaseClient});
  Future<void> addExerciseSync(String userId, String name, String description,
      List<MuscleGroup> muscles, bool isOnline) async {
    final insertedExercise = await db.into(db.exercises).insertReturning(
        ExercisesCompanion(
            userId: Value(userId),
            name: Value(name),
            description: Value(description),
            dirty: Value(!isOnline)));

    final exerciseMuscles = muscles
        .map((muscle) => ExerciseMusclesCompanion(
              exerciseId: Value(insertedExercise.id),
              muscleGroupId: Value(muscle.id),
              dirty: Value(!isOnline),
            ))
        .toList();

    await db.batch((batch) {
      batch.insertAll(db.exerciseMuscles, exerciseMuscles);
    });

    if (isOnline) {
      try {
        await supabaseClient
            .from('exercises')
            .insert(insertedExercise.toJson());
      } catch (e) {
        debugPrint('$e');
        await (db.update(db.exercises)
              ..where((ex) => ex.id.equals(insertedExercise.id)))
            .write(const ExercisesCompanion(dirty: Value(true)));
        await (db.update(db.exerciseMuscles)
              ..where((ex) => ex.exerciseId.equals(insertedExercise.id)))
            .write(const ExerciseMusclesCompanion(dirty: Value(true)));
      }
    }
  }
}
