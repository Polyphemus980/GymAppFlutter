// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedWorkout _$CompletedWorkoutFromJson(Map<String, dynamic> json) =>
    CompletedWorkout(
      dirty: json['dirty'] as bool,
      id: json['id'] as String,
      userId: json['userId'] as String,
      plannedWorkoutId: json['plannedWorkoutId'] as String?,
      workoutName: json['workoutName'] as String?,
      workoutDate: DateTime.parse(json['workoutDate'] as String),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      totalDuration: (json['totalDuration'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CompletedWorkoutToJson(CompletedWorkout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'plannedWorkoutId': instance.plannedWorkoutId,
      'workoutName': instance.workoutName,
      'workoutDate': instance.workoutDate.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'totalDuration': instance.totalDuration,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'dirty': instance.dirty,
    };
