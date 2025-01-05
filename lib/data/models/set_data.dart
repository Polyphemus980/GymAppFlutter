import 'package:json_annotation/json_annotation.dart';

import 'exercise.dart';
import 'workout_config_set.dart';

part 'set_data.g.dart';

@JsonSerializable()
class SetData {
  final Exercise exercise;
  final List<WorkoutConfigSet> sets;

  SetData({required this.exercise, required this.sets});

  SetData copyWith({Exercise? exercise, List<WorkoutConfigSet>? sets}) {
    return SetData(
        exercise: exercise ?? this.exercise, sets: sets ?? this.sets);
  }

  factory SetData.fromJson(Map<String, dynamic> json) =>
      _$SetDataFromJson(json);
  Map<String, dynamic> toJson() => _$SetDataToJson(this);
}
