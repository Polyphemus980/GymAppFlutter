import 'package:drift/drift.dart';
import 'package:gym_app/data/app_database.dart';

class OfflineUserDataSingleton {
  String? userId;
  bool hasLoaded = false;
  final AppDatabase db;

  bool get hasUser => userId != null;
  OfflineUserDataSingleton({required this.db});

  Future<void> initialize() async {
    final userData = await db.select(db.offlineUserDataTable).getSingleOrNull();
    userId = userData?.userId;
    hasLoaded = true;
  }

  Future<void> deleteUserIdFromStorage() async {
    await db.delete(db.offlineUserDataTable).go();
  }

  Future<void> addUserIdToStorage(String loggedInUserId) async {
    await db.delete(db.offlineUserDataTable).go();
    await db
        .into(db.offlineUserDataTable)
        .insert(OfflineUserDataTableCompanion(userId: Value(loggedInUserId)));
    userId = loggedInUserId;
  }
}
