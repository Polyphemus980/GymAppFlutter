import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/exercise_bloc.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../widgets/exercise_common_widgets.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExerciseBloc>(
      create: (BuildContext context) => ExerciseBloc(
          exerciseRepository: getIt.get<LocalExerciseRepository>()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Exercises")),
            actions: [
              ElevatedButton(
                onPressed: () => context.push('/exercise/add'),
                child: const Text("Add new"),
              ),
              IconButton(
                icon: const Icon(Icons.dark_mode),
                onPressed: () {
                  Provider.of<ThemeNotifier>(context, listen: false)
                      .toggleTheme();
                },
              )
            ],
          ),
          body: const Column(children: [
            SearchAndFilterRow(),
            Expanded(
              child: ExerciseList(),
            ),
          ]),
        );
      }),
    );
  }
}
