// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      dirty: json['dirty'] as bool,
      description: json['description'] as String?,
      name: json['name'] as String,
      user_id: json['user_id'] as String,
      id: json['id'] as String,
      start_position_image_path: json['start_position_image_path'] as String?,
      end_position_image_path: json['end_position_image_path'] as String?,
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'description': instance.description,
      'start_position_image_path': instance.start_position_image_path,
      'end_position_image_path': instance.end_position_image_path,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'dirty': instance.dirty,
    };
