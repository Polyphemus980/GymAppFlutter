import 'package:drift/drift.dart';

class Exercise {
  Exercise(
      {this.description,
      required this.name,
      required this.id,
      required this.createdAt,
      this.updatedAt});
  final int id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final DateTime? updatedAt;
}

class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1)();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
