// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlannedWorkout _$PlannedWorkoutFromJson(Map<String, dynamic> json) =>
    PlannedWorkout(
      dirty: json['dirty'] as bool,
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
      'dirty': instance.dirty,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
