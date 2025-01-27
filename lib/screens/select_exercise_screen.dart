import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/exercise_bloc.dart';
import 'package:gym_app/widgets/app_widgets.dart';
import 'package:gym_app/widgets/exercise_common_widgets.dart';

import '../data/models/exercise.dart';
import '../get_it_dependency_injection.dart';

class SelectExerciseScreen extends StatefulWidget {
  const SelectExerciseScreen({super.key, required this.selectedExercises});
  final List<Exercise> selectedExercises;
  @override
  State<SelectExerciseScreen> createState() => _SelectExerciseScreenState();
}

class _SelectExerciseScreenState extends State<SelectExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExerciseBloc>(
      create: (BuildContext context) => ExerciseBloc(
          exerciseRepository: getIt.get<LocalExerciseRepository>()),
      child: Builder(builder: (context) {
        return AppScaffold(
          title: "Select exercises",
          child: Column(children: [
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
            Padding(
              padding: const EdgeInsetsDirectional.all(16.0),
              child: FloatingActionButton.extended(
                  onPressed: () => context.pop(widget.selectedExercises),
                  label: Text(
                      "${widget.selectedExercises.length} exercises selected")),
            ),
          ]),
        );
      }),
    );
  }
}
