// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlannedWorkoutExercise _$PlannedWorkoutExerciseFromJson(
        Map<String, dynamic> json) =>
    PlannedWorkoutExercise(
      id: json['id'] as String,
      userId: json['userId'] as String,
      workoutId: json['workoutId'] as String,
      exerciseId: json['exerciseId'] as String,
      exerciseOrder: (json['exerciseOrder'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      dirty: json['dirty'] as bool,
    );

Map<String, dynamic> _$PlannedWorkoutExerciseToJson(
        PlannedWorkoutExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'workoutId': instance.workoutId,
      'exerciseId': instance.exerciseId,
      'exerciseOrder': instance.exerciseOrder,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'dirty': instance.dirty,
    };
