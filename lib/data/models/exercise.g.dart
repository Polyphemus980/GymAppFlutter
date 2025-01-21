// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      description: json['description'] as String?,
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      startPositionImagePath: json['startPositionImagePath'] as String?,
      endPositionImagePath: json['endPositionImagePath'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    )..muscleGroups = (json['muscleGroups'] as List<dynamic>?)
        ?.map((e) => MuscleGroup.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'startPositionImagePath': instance.startPositionImagePath,
      'endPositionImagePath': instance.endPositionImagePath,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'muscleGroups': instance.muscleGroups,
    };
