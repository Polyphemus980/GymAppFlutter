import 'package:drift/drift.dart';

class OfflineUserData {
  OfflineUserData({required this.userId, required this.email});
  String userId;
  String email;
}

@UseRowClass(OfflineUserData)
class OfflineUserDataTable extends Table {
  TextColumn get userId => text()();
  TextColumn get email => text()();
}
