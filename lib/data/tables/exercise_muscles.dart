import 'package:drift/drift.dart';

import 'exercise.dart';
import 'muscle_group.dart';

class ExerciseMuscle {
  ExerciseMuscle({required this.exerciseId, required this.muscleId});
  final int exerciseId;
  final int muscleId;
}

class ExerciseMuscles extends Table {
  IntColumn get exerciseId =>
      integer().references(Exercises, #id, onDelete: KeyAction.cascade)();
  IntColumn get muscleGroupId =>
      integer().references(MuscleGroups, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {exerciseId, muscleGroupId};
}
