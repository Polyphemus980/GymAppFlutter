import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout.dart';

class WorkoutPlan {
  WorkoutPlan(
      {required this.numWeeks,
      required this.daysPerWeek,
      required this.userId,
      required this.id,
      required this.description,
      required this.name,
      required this.createdAt,
      this.updatedAt});
  final int id;
  final String userId;
  final String name;
  final String description;
  final int numWeeks;
  final int daysPerWeek;
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<PlannedWorkout>? workouts;
}

@UseRowClass(WorkoutPlan)
class WorkoutPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get description => text()();
  TextColumn get name => text().withLength(min: 1)();
  IntColumn get numWeeks => integer()();
  IntColumn get daysPerWeek => integer()
      .check(daysPerWeek.isBiggerOrEqualValue(0))
      .check(daysPerWeek.isSmallerOrEqualValue(7))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
