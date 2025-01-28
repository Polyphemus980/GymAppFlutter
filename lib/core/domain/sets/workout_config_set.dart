import 'package:gym_app/data/models/planned/planned_set.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_config_set.g.dart';

@JsonSerializable()
class WorkoutConfigSet {
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
      isWeight: false,
      setNumber: plannedSet.set_number,
      minRepetitions: plannedSet.min_repetitions,
      maxRepetitions: plannedSet.max_repetitions,
      rpe: plannedSet.rpe,
    );
  }
  WorkoutConfigSet copy() {
    return WorkoutConfigSet(
        setNumber: setNumber,
        repetitions: repetitions,
        minRepetitions: minRepetitions,
        maxRepetitions: maxRepetitions,
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
