import 'package:drift/drift.dart';

abstract class DirtyTable extends Table {
  Column<bool> get dirty;
}
