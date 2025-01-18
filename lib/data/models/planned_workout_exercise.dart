import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_set.dart';
import 'package:gym_app/data/models/planned_workout.dart';

import 'exercise.dart';

class PlannedWorkoutExercise {
  final int id;
  final int workoutId;
  final int exerciseId;
  final int exerciseOrder;
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<PlannedSet>? sets;

  PlannedWorkoutExercise({
    required this.id,
    required this.workoutId,
    required this.exerciseId,
    required this.exerciseOrder,
    required this.createdAt,
    this.updatedAt,
    this.sets,
  });

  int get totalSets => sets?.length ?? 0;
}

@UseRowClass(PlannedWorkoutExercise)
class PlannedWorkoutExercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutId => integer().references(PlannedWorkouts, #id)();
  IntColumn get exerciseId => integer().references(Exercises, #id)();
  IntColumn get exerciseOrder =>
      integer().check(exerciseOrder.isBiggerOrEqualValue(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}