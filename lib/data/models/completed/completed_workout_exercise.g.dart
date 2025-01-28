// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedWorkoutExercise _$CompletedWorkoutExerciseFromJson(
        Map<String, dynamic> json) =>
    CompletedWorkoutExercise(
      dirty: json['dirty'] as bool,
      id: json['id'] as String,
      user_id: json['user_id'] as String,
      workout_id: json['workout_id'] as String,
      exercise_id: json['exercise_id'] as String,
      exercise_order: (json['exercise_order'] as num).toInt(),
      created_at: DateTime.parse(json['created_at'] as String),
      notes: json['notes'] as String?,
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CompletedWorkoutExerciseToJson(
        CompletedWorkoutExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'workout_id': instance.workout_id,
      'exercise_id': instance.exercise_id,
      'exercise_order': instance.exercise_order,
      'created_at': instance.created_at.toIso8601String(),
      'notes': instance.notes,
      'updated_at': instance.updated_at?.toIso8601String(),
      'dirty': instance.dirty,
    };
