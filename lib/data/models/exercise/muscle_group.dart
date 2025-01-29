import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscle_group.g.dart';

@JsonSerializable()
class MuscleGroup extends Equatable {
  const MuscleGroup({required this.id, required this.name});

  factory MuscleGroup.fromJson(Map<String, dynamic> json) =>
      _$MuscleGroupFromJson(json);
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() => _$MuscleGroupToJson(this);
}

@UseRowClass(MuscleGroup)
class MuscleGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1)();
}
