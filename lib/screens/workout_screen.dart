import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/core/extensions/context_extensions.dart';
import 'package:gym_app/data/models/workout_plans/workout_plan.dart';
import 'package:gym_app/data/repositories/workout/local_workout_repository.dart';

class WorkoutListScreen extends StatelessWidget {
  final LocalWorkoutRepository workoutRepository;
  const WorkoutListScreen({super.key, required this.workoutRepository});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Discover plans',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              AppInkWellButton(
                onTap: () {
                  context.push('/plan');
                },
                height: 100,
                text: "Create custom program",
              ),
              const SizedBox(
                height: 16.0,
              ),
              StreamBuilder(
                stream:
                    workoutRepository.watchWorkoutPlans(context.currentUserId!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Loading state
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data!.isEmpty) {
                    return const Text('No data available');
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final plan = snapshot.data![index];
                        return PlanCard(plan: plan);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final WorkoutPlan plan;
  const PlanCard({super.key, required this.plan});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).colorScheme.secondary
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              context.push('/display/${plan.id}');
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plan.name,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              plan.description,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withValues(alpha: 0.7)),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.open_in_new,
                          size: 24,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      PlanInfoChip(
                        icon: Icons.calendar_today,
                        text: '${plan.num_weeks} weeks',
                      ),
                      const SizedBox(width: 12),
                      PlanInfoChip(
                          icon: Icons.schedule,
                          text: '${plan.days_per_week} days/week'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlanInfoChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const PlanInfoChip({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
