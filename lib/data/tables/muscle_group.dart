import 'package:drift/drift.dart';

class MuscleGroup {
  MuscleGroup({required this.id, required this.name});
  final int id;
  final String name;
}

class MuscleGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1)();
}
