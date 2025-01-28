import 'package:flutter/material.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/data/models/workout_plans/workout_plan.dart';

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
