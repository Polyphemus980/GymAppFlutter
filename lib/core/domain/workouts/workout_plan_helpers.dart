import '../sets/set_data.dart';

class WorkoutDay {
  final List<SetData> sets;

  WorkoutDay({List<SetData>? sets}) : sets = sets ?? [];

  WorkoutDay copyWith({List<SetData>? sets}) {
    return WorkoutDay(
      sets: sets ?? this.sets,
    );
  }

  WorkoutDay copy() {
    List<SetData> copiedSets = sets.map((set) => set.copy()).toList();
    return WorkoutDay(
      sets: copiedSets, // Create a new list with copied sets
    );
  }
}

class WorkoutWeek {
  final List<WorkoutDay> days;

  WorkoutWeek({required this.days});

  WorkoutWeek copyWith({int? index, WorkoutDay? day}) {
    final updatedDays = List<WorkoutDay>.from(days);
    if (index != null && day != null) {
      updatedDays[index] = day;
    }
    return WorkoutWeek(days: updatedDays);
  }

  WorkoutWeek copy() {
    List<WorkoutDay> copiedDays = days.map((day) => day.copy()).toList();
    return WorkoutWeek(days: copiedDays);
  }

  WorkoutWeek.empty(int numberOfDays)
      : days = List.generate(
          numberOfDays,
          (_) => WorkoutDay(),
        );
}

class WorkoutPlanHelper {
  List<WorkoutWeek> weeks;
  final int numberOfWeeks;
  final int daysPerWeek;
  String name;
  String description;

  WorkoutPlanHelper.empty({
    required this.numberOfWeeks,
    required this.daysPerWeek,
    required this.name,
    required this.description,
  }) : weeks = List.generate(
          numberOfWeeks,
          (_) => WorkoutWeek.empty(daysPerWeek),
        );

  WorkoutWeek getWeek(int weekIndex) {
    return weeks[weekIndex];
  }

  WorkoutDay getDay(int weekIndex, int dayIndex) {
    return weeks[weekIndex].days[dayIndex];
  }

  WorkoutPlanHelper({
    required this.daysPerWeek,
    required this.numberOfWeeks,
    required this.weeks,
    required this.name,
    required this.description,
  });

  WorkoutPlanHelper copyWith({int? weekIndex, int? dayIndex, WorkoutDay? day}) {
    final updatedWeeks = List<WorkoutWeek>.from(weeks);
    if (weekIndex != null && dayIndex != null && day != null) {
      updatedWeeks[weekIndex] = weeks[weekIndex].copyWith(
        index: dayIndex,
        day: day,
      );
    }
    return WorkoutPlanHelper(
        weeks: updatedWeeks,
        name: name,
        description: description,
        daysPerWeek: daysPerWeek,
        numberOfWeeks: numberOfWeeks);
  }

  WorkoutPlanHelper copyWeeks(int fromIndex, List<int> toIndices) {
    final updatedWeeks = List<WorkoutWeek>.from(weeks);
    for (int i = 0; i < toIndices.length; i++) {
      updatedWeeks[toIndices[i]] = updatedWeeks[fromIndex].copy();
    }
    return WorkoutPlanHelper(
        weeks: updatedWeeks,
        name: name,
        description: description,
        numberOfWeeks: numberOfWeeks,
        daysPerWeek: daysPerWeek);
  }

  bool isFilled() {
    return weeks.every((week) => week.days.every((day) => day.sets.isNotEmpty));
  }

  int get length => weeks.length;
}
