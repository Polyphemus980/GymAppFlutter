import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_app/data/models/set_data.dart';
import 'package:gym_app/data/models/workout_config_set.dart';
import 'package:gym_app/data/repositories/local_workout_repository.dart';
import 'package:gym_app/screens/new_workout_plan_screen.dart';
import 'package:gym_app/widgets/app_widgets.dart';

class WorkoutPlanDisplayScreen extends HookWidget {
  final LocalWorkoutRepository workoutRepository;
  final int workoutPlanId;
  const WorkoutPlanDisplayScreen(
      {super.key,
      required this.workoutRepository,
      required this.workoutPlanId});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return AppScaffold(
      title: "Display workout plan",
      child: StreamBuilder(
        stream: workoutRepository.watchWorkoutPlanWithDetails(workoutPlanId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.data == null) {
            return const Text("No data");
          } else {
            final plan = snapshot.data!;
            return Column(
              spacing: 10,
              children: [
                DraggableHorizontalList(
                  onSelect: (index) {
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  numWeeks: plan.numWeeks,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: plan.numWeeks,
                    itemBuilder: (context, weekIndex) {
                      final workoutsWeek = plan.workouts!
                          .where((workout) => workout.weekNumber == weekIndex)
                          .toList();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListView.builder(
                          itemCount: workoutsWeek.length,
                          itemBuilder: (context, workoutIndex) {
                            return DayCard(
                              interactable: false,
                              index: workoutIndex,
                              sets: workoutsWeek[workoutIndex]
                                  .exercises!
                                  .map((exercise) {
                                return SetData(
                                    exercise: exercise.exercise!,
                                    sets: exercise.sets!.map((set) {
                                      return WorkoutConfigSet.fromPlannedSet(
                                          set);
                                    }).toList());
                              }).toList(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
