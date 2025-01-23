// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlannedWorkout _$PlannedWorkoutFromJson(Map<String, dynamic> json) =>
    PlannedWorkout(
      userId: json['userId'] as String,
      id: json['id'] as String,
      workoutPlanId: json['workoutPlanId'] as String,
      workoutName: json['workoutName'] as String?,
      dayNumber: (json['dayNumber'] as num).toInt(),
      weekNumber: (json['weekNumber'] as num).toInt(),
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map(
              (e) => PlannedWorkoutExercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlannedWorkoutToJson(PlannedWorkout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'workoutPlanId': instance.workoutPlanId,
      'workoutName': instance.workoutName,
      'dayNumber': instance.dayNumber,
      'weekNumber': instance.weekNumber,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'exercises': instance.exercises,
    };
