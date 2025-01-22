import 'package:drift/drift.dart';
import 'package:gym_app/data/models/planned_workout_exercise.dart';
import 'package:gym_app/data/models/workout_plan.dart';
import 'package:uuid/uuid.dart';

class PlannedWorkout {
  final String id;
  final String userId;

  final String workoutPlanId;
  final String? workoutName;
  final int dayNumber;
  final int weekNumber; // Added for workout plan ordering
  final String? description; // Added for instructions
  final DateTime createdAt;
  final DateTime? updatedAt;

  List<PlannedWorkoutExercise>? exercises;

  PlannedWorkout({
    required this.userId,
    required this.id,
    required this.workoutPlanId,
    this.workoutName,
    required this.dayNumber,
    required this.weekNumber,
    this.description,
    required this.createdAt,
    this.updatedAt,
    this.exercises,
  });
}

@UseRowClass(PlannedWorkout)
class PlannedWorkouts extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get workoutPlanId => text().references(WorkoutPlans, #id)();
  TextColumn get workoutName => text().nullable()();
  IntColumn get dayNumber => integer()();
  IntColumn get weekNumber => integer()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
