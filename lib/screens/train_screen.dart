import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/core/extensions/context_extensions.dart';
import 'package:gym_app/data/models/workout_plans/workout_plan.dart';
import 'package:gym_app/data/repositories/workout/local_workout_repository.dart';
import 'package:gym_app/features/timer/notifier/timer_notifier.dart';
import 'package:gym_app/workout_bloc.dart';
import 'package:provider/provider.dart';

class TrainScreen extends StatelessWidget {
  final LocalWorkoutRepository workoutRepository;
  const TrainScreen({super.key, required this.workoutRepository});

  void displayWorkoutPopUp(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
              title: const Text("Workout in progress"),
              content: const Text(
                  "A workout is currently in progress. Do you want to dismiss it and start a new one?"),
              actions: [
                TextButton(
                    onPressed: () {
                      context.read<WorkoutBloc>().add(
                          EndWorkoutEvent(dismissed: true, isMetric: false));
                      context.read<TimerNotifier>().cancelTimer();
                      context.pop();
                    },
                    child: const Text("Dismiss it")),
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text("Continue current one"))
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Start Workout',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(spacing: 16, mainAxisSize: MainAxisSize.min, children: [
            const Text(
              'Quick Start',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppInkWellButton(
              onTap: () {
                if (context.read<WorkoutBloc>().state is WorkoutInProgress) {
                  displayWorkoutPopUp(context);
                } else {
                  context.push('/new');
                }
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondaryContainer
                          .withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Custom Workout',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Start with an empty workout and add exercises as you go',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer
                                .withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Continue programs',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            StreamBuilder(
                stream: workoutRepository
                    .watchUserWorkoutPlans(context.currentUserId!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final userPlans = snapshot.data!;
                    return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      shrinkWrap: true,
                      itemCount: userPlans.length,
                      itemBuilder: (context, index) {
                        final plan = userPlans[index];
                        return WorkoutPlanContinueCard(
                            onTap: () {
                              if (context.read<WorkoutBloc>().state
                                  is WorkoutInProgress) {
                                displayWorkoutPopUp(context);
                              } else {
                                context.push('/planned_workout', extra: plan);
                              }
                            },
                            currentDay: plan.current_day,
                            currentWeek: plan.current_week,
                            plan: plan.plan!);
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text("User hasnt interacted with any plan");
                  }
                }),
          ]),
        ),
      ),
    );
  }
}

class WorkoutPlanContinueCard extends StatelessWidget {
  final int currentDay;
  final int currentWeek;
  final WorkoutPlan plan;
  final VoidCallback onTap;
  const WorkoutPlanContinueCard({
    super.key,
    required this.currentDay,
    required this.currentWeek,
    required this.plan,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWellButton(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.fitness_center,
              size: 30,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          const SizedBox(width: 16),

          // Plan Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Week ${currentWeek + 1} / Day ${currentDay + 1}',
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withValues(alpha: 0.5),
                  ),
                ),
                const SizedBox(height: 16),

                // Progress Bar
                LinearProgressIndicator(
                  value: (currentDay + currentWeek * plan.days_per_week) *
                      1.0 /
                      (plan.num_weeks * plan.days_per_week),
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .secondaryContainer
                      .withValues(alpha: 0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ],
      ),
    );
  }
}
