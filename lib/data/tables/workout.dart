import 'package:drift/drift.dart';
import 'package:gym_app/data/tables/workout_exercise.dart';
import 'package:gym_app/data/tables/workout_plan.dart';

class Workout {
  final int id;
  final int? workoutPlanId;
  final String? workoutName;
  final DateTime workoutDate;
  final int? totalDuration;
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<WorkoutExercise>? exercises;

  Workout({
    required this.id,
    this.workoutPlanId,
    this.workoutName,
    required this.workoutDate,
    this.totalDuration,
    this.notes,
    required this.createdAt,
    this.updatedAt,
    this.exercises,
  });
}

@UseRowClass(Workout)
class Workouts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutPlanId =>
      integer().nullable().references(WorkoutPlans, #id)();
  TextColumn get workoutName => text().nullable()();
  IntColumn get totalDuration =>
      integer().nullable().check(totalDuration.isBiggerThanValue(0))();
  DateTimeColumn get workoutDate =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
