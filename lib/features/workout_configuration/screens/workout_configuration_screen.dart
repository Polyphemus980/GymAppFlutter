import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/core/domain/sets/set_data.dart';
import 'package:gym_app/core/domain/sets/workout_config_set.dart';
import 'package:gym_app/data/models/workout_plans/user_workout_plans.dart';
import 'package:gym_app/data/repositories/workout/local_workout_repository.dart';
import 'package:gym_app/features/workout_configuration/blocs/workout_config_bloc.dart';
import 'package:gym_app/features/workout_configuration/widgets/configuration_screen_widgets.dart';

import '../../../data/models/exercise/exercise.dart';

class WorkoutConfigurationScreen extends StatelessWidget {
  const WorkoutConfigurationScreen(
      {super.key,
      this.data,
      this.workoutPlan,
      required this.title,
      required this.finishButtonText,
      required this.finishButtonOnTap,
      this.isRpe = false,
      required this.workoutRepository});
  final bool isRpe;
  final UserWorkoutPlans? workoutPlan;
  final String title;
  final String finishButtonText;
  final List<SetData>? data;
  final void Function(List<SetData>, String?) finishButtonOnTap;
  final LocalWorkoutRepository workoutRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutConfigBloc>(
      create: (_) => WorkoutConfigBloc(workoutRepository: workoutRepository)
        ..add(FetchDataEvent(workoutPlan: workoutPlan, data: data)),
      child: WorkoutConfigurationList(
          isRpe: isRpe,
          title: title,
          finishButtonText: finishButtonText,
          finishButtonOnTap: finishButtonOnTap),
    );
  }
}

class WorkoutConfigurationList extends StatelessWidget {
  const WorkoutConfigurationList(
      {super.key,
      this.data,
      required this.title,
      required this.finishButtonText,
      required this.finishButtonOnTap,
      this.isRpe = false});
  final bool isRpe;
  final String title;
  final String finishButtonText;
  final List<SetData>? data;
  final void Function(List<SetData>, String?) finishButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      child: BlocPresentationListener<WorkoutConfigBloc, WorkoutConfigEvent>(
          listener: (context, event) {
        if (event is ValidationFailedEvent) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(event.error),
          ));
        } else if (event is ValidationSucceededEvent) {
          finishButtonOnTap(event.sets, event.plannedWorkoutId);
        }
      }, child: BlocBuilder<WorkoutConfigBloc, WorkoutConfigState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Loaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  Expanded(
                    child: ReorderableListView.builder(
                      buildDefaultDragHandles: false,
                      itemCount: state.exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = state.exercises[index];
                        return SetCard(
                            isRpe: isRpe,
                            sets: state.sets.length > index
                                ? state.sets[index].sets
                                : [],
                            index: index,
                            key: ValueKey(exercise),
                            exercise: exercise,
                            onUpdate: (List<WorkoutConfigSet> sets) {
                              context
                                  .read<WorkoutConfigBloc>()
                                  .add(UpdateSetEvent(index, sets));
                            });
                      },
                      onReorder: (int oldIndex, int newIndex) {
                        context
                            .read<WorkoutConfigBloc>()
                            .add(ReorderExercisesEvent(oldIndex, newIndex));
                      },
                    ),
                  ),
                  AppInkWellButton(
                    onTap: () async {
                      final list = await context.push('/new/select',
                              extra: List<Exercise>.from(state.exercises))
                          as List<Exercise>;
                      context
                          .read<WorkoutConfigBloc>()
                          .add(UpdateExercisesEvent(exercises: list));
                    },
                    height: 60,
                    text: "Add exercises",
                  ),
                  AppInkWellButton(
                      onTap: () {
                        context
                            .read<WorkoutConfigBloc>()
                            .add(FinishConfigurationEvent(isRpe: isRpe));
                      },
                      height: 60,
                      text: finishButtonText),
                ],
              ),
            );
          } else if (state is Error) {
            return Center(child: Text(state.error));
          }
          return const SizedBox.shrink();
        },
      )),
    );
  }
}
