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
      userId: json['userId'] as String,
      workoutId: json['workoutId'] as String,
      exerciseId: json['exerciseId'] as String,
      exerciseOrder: (json['exerciseOrder'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      notes: json['notes'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CompletedWorkoutExerciseToJson(
        CompletedWorkoutExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'workoutId': instance.workoutId,
      'exerciseId': instance.exerciseId,
      'exerciseOrder': instance.exerciseOrder,
      'createdAt': instance.createdAt.toIso8601String(),
      'notes': instance.notes,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'dirty': instance.dirty,
    };
