import 'package:gym_app/data/models/user_preferences.dart';

abstract class LocalPreferencesRepository {
  Future<UserPreferences?> getUserPreferences(String userId);
  Future<void> insertUserPreferences(
      {required String userId, bool isMetric, bool isDarkMode});
  Future<void> updateUserPreferences(
      {required String userId, bool? isMetric, bool? isDarkMode});
}
