import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/data/repositories/exercise/local_exercise_repository.dart';
import 'package:gym_app/features/exercise/blocs/exercise_bloc.dart';
import 'package:gym_app/features/exercise/widgets/exercise_common_widgets.dart';

import '../../../core/dependency_injection/get_it_dependency_injection.dart';
import '../../../data/models/exercise/exercise.dart';

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
      create: (context) => ExerciseBloc(
          exerciseRepository: getIt.get<LocalExerciseRepository>(),),
      child: Builder(builder: (context) {
        return AppScaffold(
          title: 'Select exercises',
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
              padding: const EdgeInsetsDirectional.all(16),
              child: FloatingActionButton.extended(
                  onPressed: () => context.pop(widget.selectedExercises),
                  label: Text(
                      '${widget.selectedExercises.length} exercises selected',),),
            ),
          ],),
        );
      },),
    );
  }
}
