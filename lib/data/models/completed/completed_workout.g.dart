// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedWorkout _$CompletedWorkoutFromJson(Map<String, dynamic> json) =>
    CompletedWorkout(
      dirty: json['dirty'] as bool,
      id: json['id'] as String,
      user_id: json['user_id'] as String,
      planned_workout_id: json['planned_workout_id'] as String?,
      workout_name: json['workout_name'] as String?,
      workout_date: DateTime.parse(json['workout_date'] as String),
      start_time: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      end_time: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      total_duration: (json['total_duration'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CompletedWorkoutToJson(CompletedWorkout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'planned_workout_id': instance.planned_workout_id,
      'workout_name': instance.workout_name,
      'workout_date': instance.workout_date.toIso8601String(),
      'start_time': instance.start_time?.toIso8601String(),
      'end_time': instance.end_time?.toIso8601String(),
      'total_duration': instance.total_duration,
      'notes': instance.notes,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'dirty': instance.dirty,
    };
