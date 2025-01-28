import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/core/extensions/context_extensions.dart';
import 'package:gym_app/data/repositories/workout/local_workout_repository.dart';
import 'package:gym_app/features/workout_plans/widgets/workout_plan_list_screen_widgets.dart';

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
