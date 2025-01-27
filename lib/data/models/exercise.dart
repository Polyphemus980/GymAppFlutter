import 'package:drift/drift.dart';
import 'package:gym_app/data/models/muscle_group.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:uuid/uuid.dart';

import 'dirty_table.dart';

part 'exercise.g.dart';

@json.JsonSerializable()
class Exercise {
  Exercise({
    required this.dirty,
    this.description,
    required this.name,
    this.user_id,
    required this.id,
    this.start_position_image_path,
    this.end_position_image_path,
    required this.created_at,
    this.updated_at,
  });

  final String id;
  final String? user_id;
  final String name;
  final String? description;
  final String? start_position_image_path;
  final String? end_position_image_path;
  final DateTime created_at;
  final DateTime? updated_at;
  final bool dirty;

  List<MuscleGroup>? muscle_groups;

  Exercise copy() {
    return Exercise(
      name: name,
      id: id,
      user_id: user_id,
      dirty: dirty,
      created_at: created_at,
      updated_at: updated_at,
      start_position_image_path: start_position_image_path,
      end_position_image_path: end_position_image_path,
      description: description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Exercise) return false;

    return other.id == id &&
        other.name == name &&
        other.user_id == user_id &&
        other.description == description &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, user_id, created_at, updated_at);

  String? get muscles => muscle_groups?.map((m) => m.name).join(", ");

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson({bool excludeMuscleGroups = false}) {
    final Map<String, dynamic> data = _$ExerciseToJson(this);
    if (excludeMuscleGroups) {
      data.remove('muscle_groups');
    }
    return data;
  }
}

@UseRowClass(Exercise)
class Exercises extends Table implements DirtyTable {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get user_id => text().nullable()();
  TextColumn get name => text().withLength(min: 1)();
  TextColumn get description => text().nullable()();
  TextColumn get start_position_image_path => text().nullable()();
  TextColumn get end_position_image_path => text().nullable()();
  DateTimeColumn get created_at => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updated_at => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  BoolColumn get dirty => boolean()();
}
