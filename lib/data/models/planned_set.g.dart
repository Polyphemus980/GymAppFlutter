// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlannedSet _$PlannedSetFromJson(Map<String, dynamic> json) => PlannedSet(
      dirty: json['dirty'] as bool,
      user_id: json['user_id'] as String,
      rpe: (json['rpe'] as num).toDouble(),
      id: json['id'] as String,
      workout_exercise_id: json['workout_exercise_id'] as String,
      set_number: (json['set_number'] as num).toInt(),
      min_repetitions: (json['min_repetitions'] as num).toInt(),
      max_repetitions: (json['max_repetitions'] as num).toInt(),
    );

Map<String, dynamic> _$PlannedSetToJson(PlannedSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'workout_exercise_id': instance.workout_exercise_id,
      'set_number': instance.set_number,
      'min_repetitions': instance.min_repetitions,
      'max_repetitions': instance.max_repetitions,
      'rpe': instance.rpe,
      'dirty': instance.dirty,
    };
