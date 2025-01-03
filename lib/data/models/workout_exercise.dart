import 'package:drift/drift.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/models/sets.dart';
import 'package:gym_app/data/models/workout.dart';

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

class CompletedWorkoutExercise {
  final int id;
  final int workoutId;
  final int exerciseId;
  final int exerciseOrder;
  final DateTime createdAt;
  final String? notes;
  final DateTime? updatedAt;

  List<CompletedSet>? sets;

  CompletedWorkoutExercise({
    required this.id,
    required this.workoutId,
    required this.exerciseId,
    required this.exerciseOrder,
    required this.createdAt,
    this.notes,
    this.updatedAt,
    this.sets,
  });

  int get totalSets => sets?.length ?? 0;
}

@UseRowClass(CompletedWorkoutExercise)
class CompletedWorkoutExercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutId => integer().references(CompletedWorkouts, #id)();
  IntColumn get exerciseId => integer().references(Exercises, #id)();
  IntColumn get exerciseOrder =>
      integer().check(exerciseOrder.isBiggerOrEqualValue(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
}
