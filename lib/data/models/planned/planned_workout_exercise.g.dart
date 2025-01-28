// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlannedWorkoutExercise _$PlannedWorkoutExerciseFromJson(
        Map<String, dynamic> json) =>
    PlannedWorkoutExercise(
      id: json['id'] as String,
      user_id: json['user_id'] as String,
      workout_id: json['workout_id'] as String,
      exercise_id: json['exercise_id'] as String,
      exercise_order: (json['exercise_order'] as num).toInt(),
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      dirty: json['dirty'] as bool,
    );

Map<String, dynamic> _$PlannedWorkoutExerciseToJson(
        PlannedWorkoutExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'workout_id': instance.workout_id,
      'exercise_id': instance.exercise_id,
      'exercise_order': instance.exercise_order,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'dirty': instance.dirty,
    };
