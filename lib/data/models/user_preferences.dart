import 'package:drift/drift.dart';

class UserPreferences {
  final String userId;
  final bool isDarkMode;
  final bool isMetric;

  UserPreferences(
      {required this.userId, required this.isDarkMode, required this.isMetric});
}

@UseRowClass(UserPreferences)
class UserPreferencesTable extends Table {
  TextColumn get userId => text().unique()();
  BoolColumn get isDarkMode => boolean()();
  BoolColumn get isMetric => boolean()();
}
