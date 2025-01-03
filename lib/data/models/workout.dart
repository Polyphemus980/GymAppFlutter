import 'package:drift/drift.dart';
import 'package:gym_app/data/models/workout_exercise.dart';
import 'package:gym_app/data/models/workout_plan.dart';

class PlannedWorkout {
  final int id;
  final int workoutPlanId;
  final String? workoutName;
  final int? dayNumber; // Added for workout plan ordering
  final String? description; // Added for instructions
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<PlannedWorkoutExercise>? exercises;

  PlannedWorkout({
    required this.id,
    required this.workoutPlanId,
    this.workoutName,
    this.dayNumber,
    this.description,
    required this.createdAt,
    this.updatedAt,
    this.exercises,
  });
}

@UseRowClass(PlannedWorkout)
class PlannedWorkouts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutPlanId => integer().references(WorkoutPlans, #id)();
  TextColumn get workoutName => text().nullable()();
  IntColumn get dayNumber => integer().nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class CompletedWorkout {
  final int id;
  final int? plannedWorkoutId;
  final String? workoutName;
  final DateTime workoutDate;
  final DateTime? startTime; // Added for precise timing
  final DateTime? endTime; // Added for precise timing
  final int? totalDuration;
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<CompletedWorkoutExercise>? exercises;

  CompletedWorkout({
    required this.id,
    this.plannedWorkoutId,
    this.workoutName,
    required this.workoutDate,
    this.startTime,
    this.endTime,
    this.totalDuration,
    this.notes,
    required this.createdAt,
    this.updatedAt,
    this.exercises,
  });
}

@UseRowClass(CompletedWorkout)
class CompletedWorkouts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get plannedWorkoutId =>
      integer().nullable().references(PlannedWorkouts, #id)();
  TextColumn get workoutName => text().nullable()();
  DateTimeColumn get workoutDate =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get startTime => dateTime().nullable()();
  DateTimeColumn get endTime => dateTime().nullable()();
  IntColumn get totalDuration =>
      integer().nullable().check(totalDuration.isBiggerThanValue(0))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
