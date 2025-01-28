// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlannedWorkout _$PlannedWorkoutFromJson(Map<String, dynamic> json) =>
    PlannedWorkout(
      dirty: json['dirty'] as bool,
      user_id: json['user_id'] as String,
      id: json['id'] as String,
      workout_plan_id: json['workout_plan_id'] as String,
      workout_name: json['workout_name'] as String?,
      day_number: (json['day_number'] as num).toInt(),
      week_number: (json['week_number'] as num).toInt(),
      description: json['description'] as String?,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PlannedWorkoutToJson(PlannedWorkout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'workout_plan_id': instance.workout_plan_id,
      'workout_name': instance.workout_name,
      'day_number': instance.day_number,
      'week_number': instance.week_number,
      'description': instance.description,
      'created_at': instance.created_at.toIso8601String(),
      'dirty': instance.dirty,
      'updated_at': instance.updated_at?.toIso8601String(),
    };
