// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetData _$SetDataFromJson(Map<String, dynamic> json) => SetData(
      exercise: Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutConfigSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SetDataToJson(SetData instance) => <String, dynamic>{
      'exercise': instance.exercise,
      'sets': instance.sets,
    };
