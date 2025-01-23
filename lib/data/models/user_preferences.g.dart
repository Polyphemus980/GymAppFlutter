// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    UserPreferences(
      dirty: json['dirty'] as bool,
      user_id: json['user_id'] as String,
      is_dark_mode: json['is_dark_mode'] as bool,
      is_metric: json['is_metric'] as bool,
    );

Map<String, dynamic> _$UserPreferencesToJson(UserPreferences instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'is_dark_mode': instance.is_dark_mode,
      'is_metric': instance.is_metric,
      'dirty': instance.dirty,
    };
