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
  const NewWorkoutPlanScreen(
      {super.key, required this.numWeeks, required this.numDays});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewWorkoutPlanBloc>(
      create: (_) => NewWorkoutPlanBloc()
        ..add(InitializePlanEvent(numDays: numDays, numWeeks: numWeeks)),
      child: DaysPages(
        numWeeks: numWeeks,
        numDays: numDays,
      ),
    );
  }
}

// class DaysPages extends HookWidget {
//   final int numWeeks;
//   const DaysPages({super.key, required this.numWeeks});
//
//   @override
//   Widget build(BuildContext context) {
//     final dayNumber = useState(5);
//     final pageController = usePageController();
//     final planData = useState<WorkoutPlan>(
//         WorkoutPlan(numberOfWeeks: numWeeks, daysPerWeek: dayNumber.value));
//     return AppScaffold(
//       title: "Make schedule",
//       child: Column(
//         children: [
//           DraggableHorizontalList(
//             onSelect: (index) {
//               pageController.animateToPage(index,
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeInOut);
//             },
//             numWeeks: numWeeks,
//           ),
//           Expanded(
//               child: PageView.builder(
//             controller: pageController,
//             itemCount: numWeeks,
//             itemBuilder: (BuildContext context, int weekIndex) {
//               return ListView.builder(
//                 itemCount: dayNumber.value,
//                 itemBuilder: (context, dayIndex) {
//                   return DayCard(
//                     sets: planData.value.weeks[weekIndex].days[dayIndex].sets,
//                     index: dayIndex,
//                     onAddExercise: (index) async {
//                       await context.push('/workout/plan/new',
//                           extra: planData
//                               .value.weeks[weekIndex].days[dayIndex].sets);
//                       planData.value.weeks = [...planData.value.weeks];
//                     },
//                   );
//                 },
//               );
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }
class DaysPages extends HookWidget {
  final int numWeeks;
  final int numDays;
  const DaysPages({super.key, required this.numWeeks, required this.numDays});

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
                    return ListView.builder(
                      itemCount: state.plan.weeks[weekIndex].days.length,
                      itemBuilder: (context, dayIndex) {
                        return DayCard(
                          sets: state.plan.weeks[weekIndex].days[dayIndex].sets,
                          index: dayIndex,
                          onAddExercise: (index) async {
                            final sets = await context.push('/workout/plan/new',
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
                    );
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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sets.length,
            itemBuilder: (context, index) {
              return Row(
                children: [Expanded(child: Text(sets[index].exercise.name))],
              );
            },
          ),
          InkWell(
            onTap: () async {
              onAddExercise(index);
            },
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
              ),
              child: Center(
                child: Text(
                  "Add exercises",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
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
