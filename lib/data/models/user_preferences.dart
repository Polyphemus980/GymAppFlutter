import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_preferences.g.dart';

@JsonSerializable()
class UserPreferences {
  final String userId;
  final bool isDarkMode;
  final bool isMetric;

  UserPreferences(
      {required this.userId, required this.isDarkMode, required this.isMetric});

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
  Map<String, dynamic> toJson() => _$UserPreferencesToJson(this);
}

@UseRowClass(UserPreferences)
class UserPreferencesTable extends Table {
  TextColumn get userId => text().unique()();
  BoolColumn get isDarkMode => boolean()();
  BoolColumn get isMetric => boolean()();
}
