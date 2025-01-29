import 'package:drift/drift.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/user/user_preferences.dart';
import 'package:gym_app/data/repositories/user/local_preferences_repository.dart';

class DriftPreferencesRepository implements LocalPreferencesRepository {

  DriftPreferencesRepository({required this.db});
  final AppDatabase db;

  @override
  Future<UserPreferences?> getUserPreferences(String userId) async {
    final userPrefs = await (db.select(db.userPreferencesTable)
          ..where((userPrefs) => userPrefs.user_id.equals(userId)))
        .getSingleOrNull();
    return userPrefs;
  }

  @override
  Future<void> insertUserPreferences(
      {required String userId,
      bool isMetric = true,
      bool isDarkMode = true,}) async {
    await db.into(db.userPreferencesTable).insert(UserPreferencesTableCompanion(
          user_id: Value(userId),
          is_metric: Value(isMetric),
          is_dark_mode: Value(isDarkMode),
          dirty: const Value(false),
        ),);
  }

  @override
  Future<void> updateUserPreferences(
      {required String userId, bool? isMetric, bool? isDarkMode,}) async {
    await (db.userPreferencesTable.update()
          ..where((userPrefs) => userPrefs.user_id.equals(userId)))
        .write(UserPreferencesTableCompanion(
      is_metric: isMetric == null ? const Value.absent() : Value(isMetric),
      is_dark_mode:
          isDarkMode == null ? const Value.absent() : Value(isDarkMode),
    ),);
  }
}
