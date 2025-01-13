import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout.dart';

class WorkoutPlan {
  WorkoutPlan(
      {required this.id,
      required this.description,
      required this.title,
      required this.createdAt,
      this.updatedAt});
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<PlannedWorkout>? workouts;
}

@UseRowClass(WorkoutPlan)
class WorkoutPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  TextColumn get title => text().withLength(min: 1)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
