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

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

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
                  context.push('/workout/new');
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
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
                          color: Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, size: 30),
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
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Start with an empty workout and add exercises as you go',
                              style: TextStyle(
                                color: Colors.grey,
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: plan.color.withOpacity(0.2),
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
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    plan.description,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${plan.workouts} workouts • ${plan.duration}',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
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
