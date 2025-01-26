import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/context_extensions.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/data/repositories/local_preferences_repository.dart';
import 'package:gym_app/exercise_bloc.dart';
import 'package:gym_app/widgets/app_widgets.dart';
import 'package:gym_app/widgets/exercise_common_widgets.dart';

import '../get_it_dependency_injection.dart';
import '../theme_notifier.dart';

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

  void _toggleTheme(BuildContext context) {
    final themeNotifier = context.read<ThemeNotifier>();
    themeNotifier.toggleTheme();

    final isLightTheme = themeNotifier.isLightTheme();
    getIt.get<LocalPreferencesRepository>().updateUserPreferences(
          userId: context.currentUserId!,
          isDarkMode: !isLightTheme,
        );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Exercises",
      actions: [
        IconButton(
          icon: const Icon(Icons.dark_mode),
          onPressed: () => _toggleTheme(context),
        )
      ],
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(children: [
          SearchAndFilterRow(),
          Expanded(
            child: ExerciseList(),
          ),
        ]),
      ),
    );
  }
}
