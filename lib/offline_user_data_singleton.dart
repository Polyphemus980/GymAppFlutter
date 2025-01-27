import 'package:drift/drift.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/offline_user_data.dart';

class OfflineUserDataSingleton {
  OfflineUserData? userData;
  bool hasLoaded = false;
  final AppDatabase db;

  bool get hasUser => userData?.userId != null;
  OfflineUserDataSingleton({required this.db});

  Future<void> initialize() async {
    final userData = await db.select(db.offlineUserDataTable).getSingleOrNull();
    this.userData = userData;
    hasLoaded = true;
  }

  Future<void> deleteUserIdFromStorage() async {
    await db.delete(db.offlineUserDataTable).go();
  }

  Future<void> addUserIdToStorage(String loggedInUserId, String email) async {
    await db.delete(db.offlineUserDataTable).go();
    await db.into(db.offlineUserDataTable).insert(OfflineUserDataTableCompanion(
        userId: Value(loggedInUserId), email: Value(email)));
    userData = OfflineUserData(userId: loggedInUserId, email: email);
  }
}
