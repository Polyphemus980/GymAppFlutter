import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_preferences.g.dart';

@JsonSerializable()
class UserPreferences {
  final String user_id;
  final bool is_dark_mode;
  final bool is_metric;
  final bool dirty;

  UserPreferences({
    required this.dirty,
    required this.user_id,
    required this.is_dark_mode,
    required this.is_metric,
  });

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
  Map<String, dynamic> toJson() => _$UserPreferencesToJson(this);
}

@UseRowClass(UserPreferences)
class UserPreferencesTable extends Table {
  TextColumn get user_id => text().unique()();
  BoolColumn get dirty => boolean()();
  BoolColumn get is_dark_mode => boolean()();
  BoolColumn get is_metric => boolean()();
}
