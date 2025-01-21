import 'package:drift/drift.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/user_preferences.dart';
import 'package:gym_app/data/repositories/local_preferences_repository.dart';

class DriftPreferencesRepository implements LocalPreferencesRepository {
  final AppDatabase db;

  DriftPreferencesRepository({required this.db});

  @override
  Future<UserPreferences?> getUserPreferences(String userId) async {
    final userPrefs = await (db.select(db.userPreferencesTable)
          ..where((userPrefs) => userPrefs.userId.equals(userId)))
        .getSingleOrNull();
    return userPrefs;
  }

  @override
  Future<void> insertUserPreferences(
      {required String userId,
      bool isMetric = true,
      bool isDarkMode = true}) async {
    await db.into(db.userPreferencesTable).insert(UserPreferencesTableCompanion(
          userId: Value(userId),
          isMetric: Value(isMetric),
          isDarkMode: Value(isDarkMode),
        ));
  }

  @override
  Future<void> updateUserPreferences(
      {required String userId, bool? isMetric, bool? isDarkMode}) async {
    await (db.userPreferencesTable.update()
          ..where((userPrefs) => userPrefs.userId.equals(userId)))
        .write(UserPreferencesTableCompanion(
      isMetric: isMetric == null ? const Value.absent() : Value(isMetric),
      isDarkMode: isDarkMode == null ? const Value.absent() : Value(isDarkMode),
    ));
  }
}
