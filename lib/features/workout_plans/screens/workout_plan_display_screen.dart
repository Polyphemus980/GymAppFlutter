import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/core/dependency_injection/get_it_dependency_injection.dart';
import 'package:gym_app/core/domain/sets/set_data.dart';
import 'package:gym_app/core/domain/sets/workout_config_set.dart';
import 'package:gym_app/core/extensions/context_extensions.dart';
import 'package:gym_app/data/repositories/workout/local_workout_repository.dart';
import 'package:gym_app/data/repositories/workout/sync_workout_repository.dart';
import 'package:gym_app/features/workout_plans/widgets/new_workout_plan_screen_widgets.dart';

class WorkoutPlanDisplayScreen extends HookWidget {
  final LocalWorkoutRepository workoutRepository;
  final SyncWorkoutRepository syncWorkoutRepository;
  final String workoutPlanId;
  const WorkoutPlanDisplayScreen(
      {super.key,
      required this.workoutRepository,
      required this.workoutPlanId,
      required this.syncWorkoutRepository});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return AppScaffold(
      title: "Display workout plan",
      child: StreamBuilder(
        stream: workoutRepository.watchWorkoutPlanWithDetails(
            workoutPlanId, context.currentUserId!),
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
                  numWeeks: plan.num_weeks,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: plan.num_weeks,
                    itemBuilder: (context, weekIndex) {
                      final workoutsWeek = plan.workouts!
                          .where((workout) => workout.week_number == weekIndex)
                          .toList();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            Expanded(
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
                                            return WorkoutConfigSet
                                                .fromPlannedSet(set);
                                          }).toList());
                                    }).toList(),
                                  );
                                },
                              ),
                            ),
                            AppInkWellButton(
                                onTap: () async {
                                  await syncWorkoutRepository
                                      .signUserUpForWorkoutPlan(
                                          context.currentUserId!,
                                          workoutPlanId,
                                          getIt.isOnline);
                                  context.pop();
                                },
                                text: "Join program")
                          ],
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
