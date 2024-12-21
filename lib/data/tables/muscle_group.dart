import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

class MuscleGroup extends Equatable {
  const MuscleGroup({required this.id, required this.name});
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];
}

@UseRowClass(MuscleGroup)
class MuscleGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1)();
}
