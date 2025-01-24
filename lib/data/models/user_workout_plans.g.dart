// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_workout_plans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWorkoutPlans _$UserWorkoutPlansFromJson(Map<String, dynamic> json) =>
    UserWorkoutPlans(
      user_id: json['user_id'] as String,
      workout_plan_id: json['workout_plan_id'] as String,
      dirty: json['dirty'] as bool,
      current_week: (json['current_week'] as num).toInt(),
      current_day: (json['current_day'] as num).toInt(),
    );

Map<String, dynamic> _$UserWorkoutPlansToJson(UserWorkoutPlans instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'workout_plan_id': instance.workout_plan_id,
      'current_week': instance.current_week,
      'current_day': instance.current_day,
      'dirty': instance.dirty,
    };
