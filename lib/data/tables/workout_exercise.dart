import 'package:drift/drift.dart';
import 'package:gym_app/data/tables/exercise.dart';
import 'package:gym_app/data/tables/set.dart';
import 'package:gym_app/data/tables/workout.dart';

class WorkoutExercise {
  final int id;
  final int workoutId;
  final int exerciseId;
  final int exerciseOrder;
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<ExerciseSet>? sets;

  WorkoutExercise({
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

@UseRowClass(WorkoutExercise)
class WorkoutExercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutId => integer().references(Workouts, #id)();
  IntColumn get exerciseId => integer().references(Exercises, #id)();
  IntColumn get exerciseOrder =>
      integer().check(exerciseOrder.isBiggerOrEqualValue(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
