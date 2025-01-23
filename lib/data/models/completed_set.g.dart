// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedSet _$CompletedSetFromJson(Map<String, dynamic> json) => CompletedSet(
      dirty: json['dirty'] as bool,
      user_id: json['user_id'] as String,
      id: json['id'] as String,
      workout_exercise_id: json['workout_exercise_id'] as String,
      set_number: (json['set_number'] as num).toInt(),
      repetitions: (json['repetitions'] as num).toInt(),
      duration_seconds: (json['duration_seconds'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CompletedSetToJson(CompletedSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'workout_exercise_id': instance.workout_exercise_id,
      'set_number': instance.set_number,
      'repetitions': instance.repetitions,
      'duration_seconds': instance.duration_seconds,
      'dirty': instance.dirty,
      'weight': instance.weight,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
