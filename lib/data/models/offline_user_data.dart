import 'package:drift/drift.dart';

class OfflineUserData {
  String userId;
  OfflineUserData({required this.userId});
}

@UseRowClass(OfflineUserData)
class OfflineUserDataTable extends Table {
  TextColumn get userId => text()();
}
