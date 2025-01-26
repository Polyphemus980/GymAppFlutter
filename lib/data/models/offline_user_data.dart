import 'package:drift/drift.dart';

class OfflineUserData {
  String userId;
  String email;
  OfflineUserData({required this.userId, required this.email});
}

@UseRowClass(OfflineUserData)
class OfflineUserDataTable extends Table {
  TextColumn get userId => text()();
  TextColumn get email => text()();
}
