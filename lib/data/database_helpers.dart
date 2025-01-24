import 'package:drift/drift.dart';
import 'package:gym_app/data/app_database.dart';

import 'models/completed_set.dart';
import 'models/completed_workout.dart';
import 'models/completed_workout_exercise.dart';
import 'models/exercise.dart';
import 'models/planned_set.dart';
import 'models/planned_workout.dart';
import 'models/planned_workout_exercise.dart';
import 'models/user_preferences.dart';
import 'models/user_workout_plans.dart';
import 'models/workout_plan.dart';

CompletedSetsCompanion toCompletedSetCompanion(CompletedSet completedSet) {
  return CompletedSetsCompanion(
    id: Value(completedSet.id), // Use the provided ID
    user_id: Value(completedSet.user_id),
    workout_exercise_id: Value(completedSet.workout_exercise_id),
    set_number: Value(completedSet.set_number),
    repetitions: Value(completedSet.repetitions),
    duration_seconds: Value(completedSet.duration_seconds),
    dirty: Value(completedSet.dirty),
    weight: Value(completedSet.weight),
    created_at: Value(completedSet.created_at),
    updated_at: Value(completedSet.updated_at),
  );
}

CompletedWorkoutsCompanion toCompletedWorkoutCompanion(
    CompletedWorkout completedWorkout) {
  return CompletedWorkoutsCompanion(
    id: Value(completedWorkout.id),
    user_id: Value(completedWorkout.user_id),
    planned_workout_id: Value(completedWorkout.planned_workout_id),
    workout_name: Value(completedWorkout.workout_name),
    workout_date: Value(completedWorkout.workout_date),
    start_time: Value(completedWorkout.start_time),
    end_time: Value(completedWorkout.end_time),
    total_duration: Value(completedWorkout.total_duration),
    notes: Value(completedWorkout.notes),
    dirty: Value(completedWorkout.dirty),
    created_at: Value(completedWorkout.created_at),
    updated_at: Value(completedWorkout.updated_at),
  );
}

CompletedWorkoutExercisesCompanion toCompletedWorkoutExerciseCompanion(
    CompletedWorkoutExercise completedWorkoutExercise) {
  return CompletedWorkoutExercisesCompanion(
    id: Value(completedWorkoutExercise.id), // Use the provided ID
    user_id: Value(completedWorkoutExercise.user_id),
    workout_id: Value(completedWorkoutExercise.workout_id),
    exercise_id: Value(completedWorkoutExercise.exercise_id),
    exercise_order: Value(completedWorkoutExercise.exercise_order),
    dirty: Value(completedWorkoutExercise.dirty),
    created_at: Value(completedWorkoutExercise.created_at),
    updated_at: Value(completedWorkoutExercise.updated_at),
    notes: Value(completedWorkoutExercise.notes),
  );
}

ExercisesCompanion toExerciseCompanion(Exercise exercise) {
  return ExercisesCompanion(
    id: Value(exercise.id), // Use the provided ID
    user_id: Value(exercise.user_id),
    name: Value(exercise.name),
    description: Value(exercise.description),
    start_position_image_path: Value(exercise.start_position_image_path),
    end_position_image_path: Value(exercise.end_position_image_path),
    dirty: Value(exercise.dirty),
    created_at: Value(exercise.created_at),
    updated_at: Value(exercise.updated_at),
  );
}

ExerciseMusclesCompanion toExerciseMuscleCompanion(
    ExerciseMuscle exerciseMuscle) {
  return ExerciseMusclesCompanion(
    exercise_id:
        Value(exerciseMuscle.exercise_id), // Use the provided exercise_id
    muscle_group_id: Value(
        exerciseMuscle.muscle_group_id), // Use the provided muscle_group_id
    dirty: Value(exerciseMuscle.dirty),
  );
}

PlannedSetsCompanion toPlannedSetCompanion(PlannedSet plannedSet) {
  return PlannedSetsCompanion(
    id: Value(plannedSet.id), // Use the provided ID
    user_id: Value(plannedSet.user_id),
    workout_exercise_id: Value(plannedSet.workout_exercise_id),
    set_number: Value(plannedSet.set_number),
    min_repetitions: Value(plannedSet.min_repetitions),
    max_repetitions: Value(plannedSet.max_repetitions),
    rpe: Value(plannedSet.rpe),
    dirty: Value(plannedSet.dirty),
  );
}

PlannedWorkoutsCompanion toPlannedWorkoutCompanion(
    PlannedWorkout plannedWorkout) {
  return PlannedWorkoutsCompanion(
    id: Value(plannedWorkout.id), // Use the provided ID
    user_id: Value(plannedWorkout.user_id),
    workout_plan_id: Value(plannedWorkout.workout_plan_id),
    workout_name: Value(plannedWorkout.workout_name),
    day_number: Value(plannedWorkout.day_number),
    week_number: Value(plannedWorkout.week_number),
    description: Value(plannedWorkout.description),
    dirty: Value(plannedWorkout.dirty),
    created_at: Value(plannedWorkout.created_at),
    updated_at: Value(plannedWorkout.updated_at),
  );
}

PlannedWorkoutExercisesCompanion toPlannedWorkoutExerciseCompanion(
    PlannedWorkoutExercise plannedWorkoutExercise) {
  return PlannedWorkoutExercisesCompanion(
    id: Value(plannedWorkoutExercise.id), // Use the provided ID
    user_id: Value(plannedWorkoutExercise.user_id),
    workout_id: Value(plannedWorkoutExercise.workout_id),
    exercise_id: Value(plannedWorkoutExercise.exercise_id),
    exercise_order: Value(plannedWorkoutExercise.exercise_order),
    dirty: Value(plannedWorkoutExercise.dirty),
    created_at: Value(plannedWorkoutExercise.created_at),
    updated_at: Value(plannedWorkoutExercise.updated_at),
  );
}

UserPreferencesTableCompanion toUserPreferencesCompanion(
    UserPreferences userPreferences) {
  return UserPreferencesTableCompanion(
    user_id: Value(userPreferences.user_id), // Use the provided user_id
    is_dark_mode: Value(userPreferences.is_dark_mode),
    is_metric: Value(userPreferences.is_metric),
    dirty: Value(userPreferences.dirty),
  );
}

UserWorkoutPlansTableCompanion toUserWorkoutPlansCompanion(
    UserWorkoutPlans userWorkoutPlans) {
  return UserWorkoutPlansTableCompanion(
    user_id: Value(userWorkoutPlans.user_id), // Use the provided user_id
    workout_plan_id: Value(
        userWorkoutPlans.workout_plan_id), // Use the provided workout_plan_id
    dirty: Value(userWorkoutPlans.dirty),
  );
}

WorkoutPlansCompanion toWorkoutPlanCompanion(WorkoutPlan workoutPlan) {
  return WorkoutPlansCompanion(
    id: Value(workoutPlan.id), // Use the provided ID
    user_id: Value(workoutPlan.user_id),
    name: Value(workoutPlan.name),
    description: Value(workoutPlan.description),
    num_weeks: Value(workoutPlan.num_weeks),
    days_per_week: Value(workoutPlan.days_per_week),
    dirty: Value(workoutPlan.dirty),
    created_at: Value(workoutPlan.created_at),
    updated_at: Value(workoutPlan.updated_at),
  );
}
