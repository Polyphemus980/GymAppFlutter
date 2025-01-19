import 'package:gym_app/data/models/planned_set.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_config_set.g.dart';

//TODO: This class should be used in the configuration screen as the user may not want to include the weights/reps in there.
@JsonSerializable()
class WorkoutConfigSet {
  final int exerciseId;
  int setNumber;
  int? repetitions;
  double? weight;
  double? rpe;
  int? maxRepetitions;
  int? minRepetitions;
  int? duration;
  bool isWeight;
  bool completed;

  WorkoutConfigSet({
    required this.exerciseId,
    required this.setNumber,
    this.completed = false,
    this.repetitions,
    this.weight,
    this.rpe,
    this.minRepetitions,
    this.maxRepetitions,
    this.duration,
    this.isWeight = true,
  });

  factory WorkoutConfigSet.fromPlannedSet(PlannedSet plannedSet) {
    return WorkoutConfigSet(
      completed: false,
      exerciseId: plannedSet.workoutExerciseId,
      setNumber: plannedSet.setNumber,
      minRepetitions: plannedSet.minRepetitions,
      maxRepetitions: plannedSet.maxRepetitions,
      rpe: plannedSet.rpe,
    );
  }
  WorkoutConfigSet copy() {
    return WorkoutConfigSet(
        exerciseId: exerciseId,
        setNumber: setNumber,
        repetitions: repetitions,
        weight: weight,
        duration: duration,
        isWeight: isWeight,
        rpe: rpe,
        completed: completed);
  }

  WorkoutConfigSet copyWith(
      {bool? completed,
      int? setNumber,
      int? repetitions,
      double? weight,
      int? duration,
      double? rpe,
      bool? isWeight}) {
    return WorkoutConfigSet(
        exerciseId: exerciseId,
        setNumber: setNumber ?? this.setNumber,
        repetitions: repetitions ?? this.repetitions,
        weight: weight ?? this.weight,
        duration: duration ?? this.duration,
        completed: completed ?? this.completed,
        rpe: rpe ?? this.rpe,
        isWeight: isWeight ?? this.isWeight);
  }

  factory WorkoutConfigSet.fromJson(Map<String, dynamic> json) =>
      _$WorkoutConfigSetFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutConfigSetToJson(this);
}
