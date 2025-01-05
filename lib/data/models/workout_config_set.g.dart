// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_config_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutConfigSet _$WorkoutConfigSetFromJson(Map<String, dynamic> json) =>
    WorkoutConfigSet(
      exerciseId: (json['exerciseId'] as num).toInt(),
      setNumber: (json['setNumber'] as num).toInt(),
      completed: json['completed'] as bool? ?? false,
      repetitions: (json['repetitions'] as num?)?.toInt() ?? 0,
      weight: (json['weight'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WorkoutConfigSetToJson(WorkoutConfigSet instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'setNumber': instance.setNumber,
      'repetitions': instance.repetitions,
      'weight': instance.weight,
      'duration': instance.duration,
      'completed': instance.completed,
    };
