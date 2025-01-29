import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/core/domain/exercises/exercise_with_sets.dart';
import 'package:gym_app/data/repositories/exercise/local_exercise_repository.dart';
import 'package:gym_app/features/exercise/widgets/exercise_details_screen_widgets.dart';

class ExerciseDetailsScreen extends StatelessWidget {

  const ExerciseDetailsScreen(
      {super.key, required this.id, required this.exerciseRepository,});
  final String id;
  final LocalExerciseRepository exerciseRepository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exerciseRepository.getExerciseWithSets(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppScaffold(
              title: 'Loading...',
              child: Center(
                child: CircularProgressIndicator(),
              ),);
        } else if (snapshot.hasError) {
          return AppScaffold(
              title: 'Error', child: Text(snapshot.error.toString()),);
        } else {
          return ExerciseWithSetsDisplay(data: snapshot.data!);
        }
      },
    );
  }
}

class ExerciseWithSetsDisplay extends HookWidget {
  const ExerciseWithSetsDisplay({super.key, required this.data});
  final ExerciseWithSets data;

  @override
  Widget build(BuildContext context) {
    final isEndPosition = useState(false);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        isEndPosition.value = !isEndPosition.value;
      });
      return timer.cancel;
    }, [],);

    return AppScaffold(
      title: data.exercise.name,
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (data.exercise.start_position_image_path != null)
                  AnimatedSwitcher(
                    duration: const Duration(seconds: 2),
                    reverseDuration: const Duration(seconds: 2),
                    child: isEndPosition.value
                        ? Image.asset(
                            data.exercise.end_position_image_path!,
                            width: 200,
                            height: 300,
                          ).animate().fadeIn()
                        : Image.asset(
                            data.exercise.start_position_image_path!,
                            width: 200,
                            height: 300,
                          ).animate().fadeIn(),
                  ),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data.exercise.description ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Muscles worked',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(data.exercise.muscles ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),),
                const SizedBox(height: 24),
                const Text(
                  'Recent Sets',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                if (data.sets.isNotEmpty) ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.sets.length,
                        itemBuilder: (context, index) {
                          return ExerciseSetDetails(
                            index: index,
                            set: data.sets[index],
                          );
                        },
                      ) else const Text('No sets done yet for this exercise'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
