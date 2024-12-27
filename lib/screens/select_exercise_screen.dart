import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/exercise_bloc.dart';
import 'package:provider/provider.dart';

import '../data/models/exercise.dart';
import '../main.dart';
import '../widgets/exercise_common_widgets.dart';

class SelectExerciseScreen extends StatefulWidget {
  const SelectExerciseScreen({super.key, required this.selectedExercises});
  final List<Exercise> selectedExercises;
  @override
  State<SelectExerciseScreen> createState() => _SelectExerciseScreenState();
}

class _SelectExerciseScreenState extends State<SelectExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return BlocProvider<ExerciseBloc>(
      create: (BuildContext context) => ExerciseBloc(db),
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
          body: Column(children: [
            const SearchAndFilterRow(),
            Expanded(
              child: ExerciseList(
                onTapMethod: (e) {
                  if (widget.selectedExercises.contains(e)) {
                    setState(() {
                      widget.selectedExercises.remove(e);
                    });
                  } else {
                    setState(() {
                      widget.selectedExercises.add(e);
                    });
                  }
                },
                selectCheckMethod: (e) {
                  return widget.selectedExercises.contains(e);
                },
              ),
            ),
            if (widget.selectedExercises.isNotEmpty)
              Padding(
                padding: const EdgeInsetsDirectional.all(16.0),
                child: FloatingActionButton.extended(
                    onPressed: () => context.pop(),
                    label: Text(
                        "${widget.selectedExercises.length} exercises selected")),
              ),
          ]),
        );
      }),
    );
  }
}
