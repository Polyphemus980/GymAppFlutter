// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// class WorkoutListScreen extends StatelessWidget {
//   const WorkoutListScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const Text("Custom workout"),
//           ElevatedButton(
//             onPressed: () {
//               context.push('/workout/new');
//             },
//             child: const Text("Start a custom workout"),
//           ),
//           const Text("Templates"),
//           const Card(child: Text("Template 1")),
//           const Text("Workout plans"),
//           ElevatedButton(
//               onPressed: () {}, child: const Text("Show workout plans")),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/widgets/app_widgets.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../workout_bloc.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

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
                      context.read<WorkoutBloc>().add(EndWorkoutEvent());
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Quick start section
              const Text(
                'Quick Start',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  if (context.read<WorkoutBloc>().state is WorkoutInProgress) {
                    displayWorkoutPopUp(context);
                  } else {
                    context.push('/new');
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
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
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
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
              ),
              const SizedBox(height: 32),

              // Workout plans section
              const Text(
                'Workout Plans',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  context.push('/plan');
                },
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Center(
                    child: Text("Add new workout plan",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: workoutPlans.length,
                itemBuilder: (context, index) {
                  final plan = workoutPlans[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        // Handle workout plan selection
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color:
                              Provider.of<ThemeNotifier>(context).isLightTheme()
                                  ? Colors.white
                                  : Colors.grey.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: plan.color.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                plan.icon,
                                color: plan.color,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plan.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Provider.of<ThemeNotifier>(context)
                                                    .isLightTheme()
                                                ? Colors.black
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    plan.description,
                                    style: TextStyle(
                                      color: Provider.of<ThemeNotifier>(context)
                                              .isLightTheme()
                                          ? Colors.grey.shade600
                                          : Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                              .withValues(alpha: 0.6),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${plan.workouts} workouts • ${plan.duration}',
                                    style: TextStyle(
                                      color: Provider.of<ThemeNotifier>(context)
                                              .isLightTheme()
                                          ? Colors.grey.shade500
                                          : Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                              .withValues(alpha: 0.4),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Model class for workout plans
class WorkoutPlan {
  final String name;
  final String description;
  final int workouts;
  final String duration;
  final IconData icon;
  final Color color;

  const WorkoutPlan({
    required this.name,
    required this.description,
    required this.workouts,
    required this.duration,
    required this.icon,
    required this.color,
  });
}

// Sample workout plans data
final List<WorkoutPlan> workoutPlans = [
  const WorkoutPlan(
    name: 'Strength Training',
    description: 'Build muscle and increase strength',
    workouts: 12,
    duration: '8 weeks',
    icon: Icons.fitness_center,
    color: Colors.blue,
  ),
  const WorkoutPlan(
    name: 'Strength Training',
    description: 'Build muscle and increase strength',
    workouts: 12,
    duration: '8 weeks',
    icon: Icons.fitness_center,
    color: Colors.blue,
  ),
  const WorkoutPlan(
    name: 'Strength Training',
    description: 'Build muscle and increase strength',
    workouts: 12,
    duration: '8 weeks',
    icon: Icons.fitness_center,
    color: Colors.blue,
  ),
  const WorkoutPlan(
    name: 'Strength Training',
    description: 'Build muscle and increase strength',
    workouts: 12,
    duration: '8 weeks',
    icon: Icons.fitness_center,
    color: Colors.blue,
  ),
  const WorkoutPlan(
    name: 'Weight Loss',
    description: 'High-intensity workouts for fat burning',
    workouts: 15,
    duration: '6 weeks',
    icon: Icons.directions_run,
    color: Colors.green,
  ),
  const WorkoutPlan(
    name: 'Flexibility',
    description: 'Improve mobility and reduce injury risk',
    workouts: 10,
    duration: '4 weeks',
    icon: Icons.self_improvement,
    color: Colors.purple,
  ),
];
