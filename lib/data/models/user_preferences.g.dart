// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    UserPreferences(
      userId: json['userId'] as String,
      isDarkMode: json['isDarkMode'] as bool,
      isMetric: json['isMetric'] as bool,
    );

Map<String, dynamic> _$UserPreferencesToJson(UserPreferences instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'isDarkMode': instance.isDarkMode,
      'isMetric': instance.isMetric,
    };
