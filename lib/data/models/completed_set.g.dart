// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedSet _$CompletedSetFromJson(Map<String, dynamic> json) => CompletedSet(
      userId: json['userId'] as String,
      id: json['id'] as String,
      workoutExerciseId: json['workoutExerciseId'] as String,
      setNumber: (json['setNumber'] as num).toInt(),
      repetitions: (json['repetitions'] as num).toInt(),
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CompletedSetToJson(CompletedSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'workoutExerciseId': instance.workoutExerciseId,
      'setNumber': instance.setNumber,
      'repetitions': instance.repetitions,
      'durationSeconds': instance.durationSeconds,
      'weight': instance.weight,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
