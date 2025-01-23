// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutPlan _$WorkoutPlanFromJson(Map<String, dynamic> json) => WorkoutPlan(
      numWeeks: (json['numWeeks'] as num).toInt(),
      daysPerWeek: (json['daysPerWeek'] as num).toInt(),
      userId: json['userId'] as String,
      id: json['id'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    )..workouts = (json['workouts'] as List<dynamic>?)
        ?.map((e) => PlannedWorkout.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$WorkoutPlanToJson(WorkoutPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'numWeeks': instance.numWeeks,
      'daysPerWeek': instance.daysPerWeek,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'workouts': instance.workouts,
    };
