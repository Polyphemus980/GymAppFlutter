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
            user_id: Value(userId),
            name: Value(name),
            description: Value(description),
            dirty: Value(!isOnline)));

    final exerciseMuscles = muscles
        .map((muscle) => ExerciseMusclesCompanion(
              exercise_id: Value(insertedExercise.id),
              muscle_group_id: Value(muscle.id),
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
            .insert(insertedExercise.toJson(excludeMuscleGroups: true));

        final exerciseMuscles = muscles
            .map((muscle) => {
                  'exercise_id': insertedExercise.id,
                  'muscle_group_id': muscle.id,
                  'dirty': !isOnline,
                })
            .toList();
        await supabaseClient.from('exercise_muscles').insert(exerciseMuscles);
      } catch (e) {
        debugPrint('$e');
        await (db.update(db.exercises)
              ..where((ex) => ex.id.equals(insertedExercise.id)))
            .write(const ExercisesCompanion(dirty: Value(true)));
        await (db.update(db.exerciseMuscles)
              ..where((ex) => ex.exercise_id.equals(insertedExercise.id)))
            .write(const ExerciseMusclesCompanion(dirty: Value(true)));
      }
    }
  }

  Future<void> removeExerciseSync(String exerciseId, bool isOnline) async {
    if (isOnline) {
      db.transaction(() async {
        await (db.delete(db.exercises)..where((ex) => ex.id.equals(exerciseId)))
            .go();

        await supabaseClient
            .from('exercises')
            .delete()
            .eq('exerciseId', exerciseId);
      });
    } else {
      debugPrint('No removing while offline :) \n');
    }
  }
}
