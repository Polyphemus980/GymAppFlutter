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
      sets: (json['sets'] as List<dynamic>?)
          ?.map((e) => PlannedSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..exercise = json['exercise'] == null
        ? null
        : Exercise.fromJson(json['exercise'] as Map<String, dynamic>);

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
      'sets': instance.sets,
      'exercise': instance.exercise,
    };
