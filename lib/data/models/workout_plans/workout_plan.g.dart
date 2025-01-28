// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutPlan _$WorkoutPlanFromJson(Map<String, dynamic> json) => WorkoutPlan(
      dirty: json['dirty'] as bool,
      num_weeks: (json['num_weeks'] as num).toInt(),
      days_per_week: (json['days_per_week'] as num).toInt(),
      user_id: json['user_id'] as String,
      id: json['id'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WorkoutPlanToJson(WorkoutPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'description': instance.description,
      'num_weeks': instance.num_weeks,
      'days_per_week': instance.days_per_week,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'dirty': instance.dirty,
    };
