import 'package:drift/drift.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/tables/workout.dart';

extension TodoToCompanion on Workout {
  WorkoutsCompanion toCompanion2() {
    return WorkoutsCompanion(
      id: Value(id),
      workoutPlanId:
          workoutPlanId != null ? Value(workoutPlanId!) : const Value.absent(),
      workoutName:
          workoutName != null ? Value(workoutName!) : const Value.absent(),
      workoutDate: Value(workoutDate),
      totalDuration:
          totalDuration != null ? Value(totalDuration!) : const Value.absent(),
      notes: notes != null ? Value(notes!) : const Value.absent(),
      createdAt: Value(createdAt),
      updatedAt: updatedAt != null ? Value(updatedAt!) : const Value.absent(),
    );
  }
}

class WorkoutDataSource {
  WorkoutDataSource(this.db_);

  final AppDatabase db_;

  Future<Workout?> get(int id) async {
    final workout = await (db_.select(db_.workouts)
          ..where((workout) => workout.id.equals(id)))
        .getSingleOrNull();
    return workout;
  }

  Future<void> delete(int id) async {
    await (db_.delete(db_.workouts)..where((workout) => workout.id.equals(id)))
        .go();
  }

  Future<List<Workout>> getAll() async {
    final workouts = await (db_.select(db_.workouts)).get();
    return workouts;
  }

  Future<void> update(Workout workout) async {
    await (db_.update(db_.workouts)..where((w) => w.id.equals(workout.id)))
        .write(workout.toCompanion2());
  }

  Stream<Workout?> watchWorkoutWithExercises(int id) async* {
    final workoutStream = (db_.select(db_.workouts)
          ..where((workout) => workout.id.equals(id)))
        .watchSingleOrNull();

    await for (final workout in workoutStream) {
      if (workout == null) {
        yield null;
        continue;
      }

      final workoutExercisesStream = (db_.select(db_.workoutExercises)
            ..where((exercise) => exercise.workoutId.equals(id)))
          .watch();

      await for (final workoutExercises in workoutExercisesStream) {
        for (final exercise in workoutExercises) {
          // Stream the sets for each exercise
          exercise.sets = await (db_.select(db_.exerciseSets)
                ..where((set) => set.workoutExerciseId.equals(exercise.id)))
              .get();
        }

        workout.exercises = workoutExercises;
        yield workout;
      }
    }
  }
}
