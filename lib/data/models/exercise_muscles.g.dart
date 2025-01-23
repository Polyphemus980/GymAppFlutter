// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_muscles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseMuscle _$ExerciseMuscleFromJson(Map<String, dynamic> json) =>
    ExerciseMuscle(
      dirty: json['dirty'] as bool,
      exercise_id: (json['exercise_id'] as num).toInt(),
      muscle_group_id: (json['muscle_group_id'] as num).toInt(),
    );

Map<String, dynamic> _$ExerciseMuscleToJson(ExerciseMuscle instance) =>
    <String, dynamic>{
      'exercise_id': instance.exercise_id,
      'muscle_group_id': instance.muscle_group_id,
      'dirty': instance.dirty,
    };
