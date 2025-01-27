import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/exercise_bloc.dart';
import 'package:gym_app/widgets/app_widgets.dart';
import 'package:gym_app/widgets/exercise_common_widgets.dart';

import '../get_it_dependency_injection.dart';

class ExerciseListScreen extends StatelessWidget {
  const ExerciseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ExerciseBloc(
            exerciseRepository: getIt.get<LocalExerciseRepository>()),
        child: const ExerciseScreen());
  }
}

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Exercises",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(children: [
          const SearchAndFilterRow(),
          Expanded(
            child: ExerciseList(
              onTapMethod: (exercise) {
                context.push('/exercise/${exercise.id}');
              },
            ),
          ),
        ]),
      ),
    );
  }
}
