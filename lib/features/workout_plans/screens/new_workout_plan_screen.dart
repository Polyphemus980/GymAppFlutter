import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/core/domain/sets/set_data.dart';
import 'package:gym_app/core/extensions/context_extensions.dart';
import 'package:gym_app/data/repositories/workout/sync_workout_repository.dart';
import 'package:gym_app/features/workout_plans/blocs/new_workout_plan_bloc.dart';
import 'package:gym_app/features/workout_plans/widgets/new_workout_plan_screen_widgets.dart';

import '../../../core/dependency_injection/get_it_dependency_injection.dart';

class NewWorkoutPlanScreen extends StatelessWidget {
  const NewWorkoutPlanScreen({
    super.key,
    required this.numWeeks,
    required this.numDays,
    required this.name,
    required this.description,
  });
  final int numWeeks;
  final int numDays;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewWorkoutPlanBloc>(
      create: (_) => NewWorkoutPlanBloc(
        syncWorkoutRepository: getIt.get<SyncWorkoutRepository>(),
      )..add(
          InitializePlanEvent(
            numDays: numDays,
            numWeeks: numWeeks,
            name: name,
            description: description,
          ),
        ),
      child: DaysPages(
        numWeeks: numWeeks,
        numDays: numDays,
      ),
    );
  }
}

class DaysPages extends HookWidget {
  const DaysPages({super.key, required this.numWeeks, required this.numDays});
  final int numWeeks;
  final int numDays;

  void _showFilters(BuildContext parentContext) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: parentContext,
      isScrollControlled: true,
      builder: (modalContext) {
        return BlocProvider.value(
          value: parentContext.read<NewWorkoutPlanBloc>(),
          child: FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 1,
            child: DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 1,
              expand: false,
              builder: (context, scrollController) {
                return const CopyModal();
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return AppScaffold(
      title: 'Make schedule',
      child: Column(
        children: [
          DraggableHorizontalList(
            onSelect: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            numWeeks: numWeeks,
          ),
          Expanded(
            child: BlocBuilder<NewWorkoutPlanBloc, NewWorkoutPlanState>(
              builder: (context, state) {
                if (state is InProgressState) {
                  return PageView.builder(
                    controller: pageController,
                    itemCount: numWeeks,
                    itemBuilder: (context, weekIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount:
                                    state.plan.weeks[weekIndex].days.length,
                                itemBuilder: (context, dayIndex) {
                                  return DayCard(
                                    sets: state.plan.weeks[weekIndex]
                                        .days[dayIndex].sets,
                                    index: dayIndex,
                                    onAddExercise: (index) async {
                                      final sets = await context.push(
                                            '/plan/create/new',
                                            extra: List<SetData>.from(
                                              state.plan.weeks[weekIndex]
                                                  .days[dayIndex].sets,
                                            ),
                                          ) as List<SetData>? ??
                                          [];

                                      if (context.mounted) {
                                        context.read<NewWorkoutPlanBloc>().add(
                                              ChangedDayEvent(
                                                sets: sets,
                                                weekIndex: weekIndex,
                                                dayIndex: dayIndex,
                                              ),
                                            );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: AppInkWellButton(
                                onTap: () {
                                  _showFilters(context);
                                },
                                height: 75,
                                text: 'Copy days',
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: AppInkWellButton(
                                onTap: () {
                                  if (!state.plan.isFilled()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Every training day must have at least 1 exercise',
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  context.read<NewWorkoutPlanBloc>().add(
                                        FinishCreationEvent(
                                          isOnline: getIt.isOnline,
                                          userId: context.currentUserId!,
                                        ),
                                      );
                                },
                                height: 75,
                                text: 'Finish',
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
