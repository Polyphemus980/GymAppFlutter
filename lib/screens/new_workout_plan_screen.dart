import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/models/set_data.dart';
import 'package:gym_app/new_workout_plan_bloc.dart';
import 'package:gym_app/widgets/app_widgets.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class NewWorkoutPlanScreen extends StatelessWidget {
  final int numWeeks;
  final int numDays;
  final String name;
  final String description;
  const NewWorkoutPlanScreen(
      {super.key,
      required this.numWeeks,
      required this.numDays,
      required this.name,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewWorkoutPlanBloc>(
      create: (_) => NewWorkoutPlanBloc()
        ..add(InitializePlanEvent(
            numDays: numDays,
            numWeeks: numWeeks,
            name: name,
            description: description)),
      child: DaysPages(
        numWeeks: numWeeks,
        numDays: numDays,
      ),
    );
  }
}

class DaysPages extends HookWidget {
  final int numWeeks;
  final int numDays;
  const DaysPages({super.key, required this.numWeeks, required this.numDays});

  void _showFilters(BuildContext parentContext) {
    showModalBottomSheet(
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
                  maxChildSize: 1,
                  expand: false,
                  builder: (context, scrollController) {
                    return const CopyModal();
                  }),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    return AppScaffold(
      title: "Make schedule",
      child: Column(
        children: [
          DraggableHorizontalList(
            onSelect: (index) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
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
                  itemBuilder: (BuildContext context, int weekIndex) {
                    return Column(spacing: 10, children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.plan.weeks[weekIndex].days.length,
                          itemBuilder: (context, dayIndex) {
                            return DayCard(
                              sets: state
                                  .plan.weeks[weekIndex].days[dayIndex].sets,
                              index: dayIndex,
                              onAddExercise: (index) async {
                                final sets = await context.push(
                                    '/plan/create/new',
                                    extra: List<SetData>.from(state
                                        .plan
                                        .weeks[weekIndex]
                                        .days[dayIndex]
                                        .sets)) as List<SetData>;
                                context.read<NewWorkoutPlanBloc>().add(
                                    ChangedDayEvent(
                                        sets: sets,
                                        weekIndex: weekIndex,
                                        dayIndex: dayIndex));
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: AppInkWellButton(
                              onTap: () {
                                _showFilters(context);
                              },
                              height: 75,
                              text: "Copy days")),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: AppInkWellButton(
                              onTap: () {
                                if (!state.plan.isFilled()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Every training day must have at least 1 exercise")));
                                  return;
                                }
                                context
                                    .read<NewWorkoutPlanBloc>()
                                    .add(FinishCreationEvent());
                              },
                              height: 75,
                              text: "Finish")),
                    ]);
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ),
        ],
      ),
    );
  }
}

class DayCard extends StatelessWidget {
  final int index;
  final List<SetData> sets;
  final void Function(int) onAddExercise;
  const DayCard(
      {super.key,
      required this.sets,
      required this.onAddExercise,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return DayContainer(
      width: double.infinity,
      title: "Day ${index + 1}",
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (sets.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sets.length,
              separatorBuilder: (context, index) => const Divider(height: 16),
              itemBuilder: (context, index) {
                final exercise = sets[index];
                return PlanExerciseTile(
                  exercise: exercise,
                );
              },
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "No exercises added yet",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
            ),
          AppInkWellButton(
            onTap: () async {
              onAddExercise(index);
            },
            width: 200,
            height: 50,
            text: "Add exercises",
          ),
        ],
      ),
    );
  }
}

class DraggableHorizontalList extends HookWidget {
  final int numWeeks;
  final void Function(int) onSelect;
  const DraggableHorizontalList({
    required this.onSelect,
    super.key,
    required this.numWeeks,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final isDragging = useState(false);
    final startX = useState(0.0);
    final scrollStartPosition = useState(0.0);
    final selected = useState(0);

    return Container(
      height: 50,
      color: Theme.of(context).colorScheme.onPrimary,
      child: Center(
        child: Listener(
          onPointerDown: (PointerDownEvent event) {
            isDragging.value = true;
            startX.value = event.position.dx;
            scrollStartPosition.value = scrollController.position.pixels;
          },
          onPointerMove: (PointerMoveEvent event) {
            if (!isDragging.value) return;

            final dx = event.position.dx - startX.value;
            final newPosition = scrollStartPosition.value - dx;

            scrollController.jumpTo(
              newPosition.clamp(
                scrollController.position.minScrollExtent,
                scrollController.position.maxScrollExtent,
              ),
            );
          },
          onPointerUp: (PointerUpEvent event) {
            isDragging.value = false;
          },
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: numWeeks,
            itemBuilder: (context, index) {
              return TextButton(
                  onPressed: () {
                    onSelect(index);
                    selected.value = index;
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: selected.value == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.secondary),
                  child: Text("Week ${index + 1}"));
            },
          ),
        ),
      ),
    );
  }
}

class DayContainer extends StatelessWidget {
  final Widget child;

  final double? height;

  final double width;

  final String? title;
  final List<Widget>? actions;
  const DayContainer(
      {super.key,
      required this.child,
      required this.width,
      this.height,
      this.title,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Provider.of<ThemeNotifier>(context).isLightTheme()
            ? Colors.white
            : Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            if (title != null)
              Flexible(
                child: Text(
                  title!,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 24, color: Theme.of(context).primaryColor),
                ),
              ),
            if (actions != null)
              Row(mainAxisSize: MainAxisSize.min, children: actions!),
          ]),
          child,
        ],
      ),
    );
  }
}

class PlanExerciseTile extends StatelessWidget {
  final SetData exercise;
  const PlanExerciseTile({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .secondaryContainer
            .withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  exercise.exercise.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${exercise.sets.length} sets",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: exercise.sets.asMap().entries.map((entry) {
              final setIndex = entry.key;
              final set = entry.value;
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "Set ${setIndex + 1}: Perform ${set.minRepetitions == set.maxRepetitions ? set.minRepetitions : "${set.minRepetitions} - ${set.maxRepetitions}"} reps ${set.rpe != null ? 'at RPE ${set.rpe}' : ''}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class CopyModal extends HookWidget {
  const CopyModal({super.key});

  @override
  Widget build(BuildContext context) {
    final from = useState(-1);
    final to = useState(<int>[]);

    return BlocBuilder<NewWorkoutPlanBloc, NewWorkoutPlanState>(
      builder: (context, state) {
        if (state is InProgressState) {
          return Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Copy Workout Week",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 32),

                    // Source Week Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Source Week",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List<int>.generate(
                              state.plan.weeks.length, (i) => i).map((index) {
                            bool isEnabled = state.plan.weeks[index].days
                                .every((day) => day.sets.isNotEmpty);
                            return AnimatedScale(
                              scale: isEnabled ? 1.0 : 0.95,
                              duration: const Duration(milliseconds: 200),
                              child: FilterChip(
                                label: Text(
                                  "Week ${index + 1}",
                                  style: TextStyle(
                                    fontWeight: from.value == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: from.value == index
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                  ),
                                ),
                                selected: from.value == index,
                                showCheckmark: false,
                                selectedColor:
                                    Theme.of(context).colorScheme.primary,
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                                onSelected: isEnabled
                                    ? (bool selected) {
                                        if (!selected) {
                                          from.value = -1;
                                        } else {
                                          from.value = index;
                                          to.value = to.value..remove(index);
                                        }
                                      }
                                    : null,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Target Weeks Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Target Weeks",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List<int>.generate(
                              state.plan.weeks.length, (i) => i).map((index) {
                            return FilterChip(
                              label: Text(
                                "Week ${index + 1}",
                                style: TextStyle(
                                  fontWeight: to.value.contains(index)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: to.value.contains(index)
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              selected: to.value.contains(index),
                              showCheckmark: false,
                              selectedColor:
                                  Theme.of(context).colorScheme.primary,
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              onSelected: from.value == index
                                  ? null
                                  : (bool selected) {
                                      if (selected) {
                                        to.value = [...to.value, index];
                                      } else {
                                        to.value = to.value
                                            .where((i) => index != i)
                                            .toList();
                                      }
                                    },
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Copy Button
                    ElevatedButton.icon(
                      onPressed: from.value != -1 && to.value.isNotEmpty
                          ? () {
                              context.read<NewWorkoutPlanBloc>().add(
                                    CopyWeekEvent(
                                        fromIndex: from.value,
                                        toIndices: to.value),
                                  );
                              context.pop();
                            }
                          : null,
                      icon: const Icon(Icons.copy),
                      label: const Text('Copy Week'),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
