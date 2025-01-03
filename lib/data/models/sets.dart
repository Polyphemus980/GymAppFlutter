import 'package:drift/drift.dart';

import 'workout_exercise.dart';

class CompletedSet {
  final int id;
  final int workoutExerciseId;
  final int setNumber;
  final int repetitions;
  final int? durationSeconds;
  final double? weight;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CompletedSet({
    required this.id,
    required this.workoutExerciseId,
    required this.setNumber,
    required this.repetitions,
    this.durationSeconds,
    this.weight,
    this.createdAt,
    this.updatedAt,
  });

  double? get volume => weight != null ? weight! * repetitions : null;
}

@UseRowClass(CompletedSet)
class CompletedSets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutExerciseId =>
      integer().references(CompletedWorkoutExercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get repetitions => integer()();
  IntColumn get durationSeconds => integer().nullable()();
  RealColumn get weight => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class PlannedSet {
  PlannedSet({
    required this.id,
    required this.workoutExerciseId,
    required this.setNumber,
    required this.repetitions,
    this.weight,
  });
  final int id;
  final int workoutExerciseId;
  final int setNumber;
  final int repetitions;
  final double? weight;
}

@UseRowClass(PlannedSet)
class PlannedSets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutExerciseId =>
      integer().references(PlannedWorkoutExercises, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get repetitions => integer()();
  RealColumn get weight => real().nullable()();
}

//TODO: This class should be used in the configuration screen as the user may not want to include the weights/reps in there.
class WorkoutConfigSet {
  final int exerciseId;
  final int setNumber;
  int? repetitions;
  double? weight;
  int? duration;
  bool completed;

  WorkoutConfigSet({
    required this.exerciseId,
    required this.setNumber,
    this.completed = false,
    this.repetitions = 0,
    this.weight,
    this.duration,
  });

  factory WorkoutConfigSet.fromPlannedSet(PlannedSet plannedSet) {
    return WorkoutConfigSet(
      completed: false,
      exerciseId: plannedSet.workoutExerciseId,
      setNumber: plannedSet.setNumber,
      repetitions: plannedSet.repetitions,
      weight: plannedSet.weight,
    );
  }

  WorkoutConfigSet copyWith(
      {bool? completed,
      int? setNumber,
      int? repetitions,
      double? weight,
      int? duration}) {
    return WorkoutConfigSet(
      exerciseId: exerciseId,
      setNumber: setNumber ?? this.setNumber,
      repetitions: repetitions ?? this.repetitions,
      weight: weight ?? this.weight,
      duration: duration ?? this.duration,
      completed: completed ?? this.completed,
    );
  }
}
