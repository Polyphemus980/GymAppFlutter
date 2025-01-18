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
    this.duration,
    this.isWeight = true,
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

  factory WorkoutConfigSet.fromJson(Map<String, dynamic> json) =>
      _$WorkoutConfigSetFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutConfigSetToJson(this);
}
