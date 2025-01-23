// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_muscles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseMuscle _$ExerciseMuscleFromJson(Map<String, dynamic> json) =>
    ExerciseMuscle(
      dirty: json['dirty'] as bool,
      exerciseId: (json['exerciseId'] as num).toInt(),
      muscleId: (json['muscleId'] as num).toInt(),
    );

Map<String, dynamic> _$ExerciseMuscleToJson(ExerciseMuscle instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'muscleId': instance.muscleId,
      'dirty': instance.dirty,
    };
