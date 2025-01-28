// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_config_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutConfigSet _$WorkoutConfigSetFromJson(Map<String, dynamic> json) =>
    WorkoutConfigSet(
      setNumber: (json['setNumber'] as num).toInt(),
      completed: json['completed'] as bool? ?? false,
      repetitions: (json['repetitions'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      rpe: (json['rpe'] as num?)?.toDouble(),
      minRepetitions: (json['minRepetitions'] as num?)?.toInt(),
      maxRepetitions: (json['maxRepetitions'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      isWeight: json['isWeight'] as bool? ?? true,
    );

Map<String, dynamic> _$WorkoutConfigSetToJson(WorkoutConfigSet instance) =>
    <String, dynamic>{
      'setNumber': instance.setNumber,
      'repetitions': instance.repetitions,
      'weight': instance.weight,
      'rpe': instance.rpe,
      'maxRepetitions': instance.maxRepetitions,
      'minRepetitions': instance.minRepetitions,
      'duration': instance.duration,
      'isWeight': instance.isWeight,
      'completed': instance.completed,
    };
