import 'package:drift/drift.dart';

abstract class DirtyTable {
  Column<bool> get dirty;
}
