// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlannedSet _$PlannedSetFromJson(Map<String, dynamic> json) => PlannedSet(
      userId: json['userId'] as String,
      rpe: (json['rpe'] as num).toDouble(),
      id: json['id'] as String,
      workoutExerciseId: json['workoutExerciseId'] as String,
      setNumber: (json['setNumber'] as num).toInt(),
      minRepetitions: (json['minRepetitions'] as num).toInt(),
      maxRepetitions: (json['maxRepetitions'] as num).toInt(),
    );

Map<String, dynamic> _$PlannedSetToJson(PlannedSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'workoutExerciseId': instance.workoutExerciseId,
      'setNumber': instance.setNumber,
      'minRepetitions': instance.minRepetitions,
      'maxRepetitions': instance.maxRepetitions,
      'rpe': instance.rpe,
    };
