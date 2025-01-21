import 'package:drift/drift.dart';
import 'package:gym_app/data/models/muscle_group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

// Exercises will not be replicated across devices as most of them are from assets
// and storing only the custom ones would take too much time.
@JsonSerializable()
class Exercise {
  Exercise(
      {this.description,
      required this.name,
      required this.id,
      this.startPositionImagePath,
      this.endPositionImagePath,
      required this.createdAt,
      this.updatedAt});
  final int id;
  final String name;
  final String? description;
  final String? startPositionImagePath;
  final String? endPositionImagePath;
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<MuscleGroup>? muscleGroups;
  Exercise copy() {
    return Exercise(
        name: name,
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        startPositionImagePath: startPositionImagePath,
        endPositionImagePath: endPositionImagePath,
        description: description);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Exercise) return false;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt, updatedAt);

  String? get muscles => muscleGroups!.map((m) => m.name).join(", ");

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}

@UseRowClass(Exercise)
class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1)();
  TextColumn get description => text().nullable()();
  TextColumn get startPositionImagePath => text().nullable()();
  TextColumn get endPositionImagePath => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
