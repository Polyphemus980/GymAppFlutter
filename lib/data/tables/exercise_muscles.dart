import 'package:drift/drift.dart';

import 'exercise.dart';
import 'muscle_group.dart';

class ExerciseMuscle {
  ExerciseMuscle({required this.exerciseId, required this.muscleId});
  final int exerciseId;
  final int muscleId;
}

class ExerciseMuscles extends Table {
  IntColumn get exerciseId => integer().references(Exercises, #id)();
  IntColumn get muscleGroupId => integer().references(MuscleGroups, #id)();

  @override
  Set<Column> get primaryKey => {exerciseId, muscleGroupId};
}
