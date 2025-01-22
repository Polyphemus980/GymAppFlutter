import 'package:drift/drift.dart';
import 'package:gym_app/data/models/completed_workout_exercise.dart';
import 'package:gym_app/data/models/planned_workout.dart';
import 'package:uuid/uuid.dart';

class CompletedWorkout {
  final String id;
  final String userId;
  final String? plannedWorkoutId;
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
    required this.userId,
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
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get plannedWorkoutId =>
      text().nullable().references(PlannedWorkouts, #id)();
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
