import 'dart:io' show Platform;

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/models/set_data.dart';
import 'package:gym_app/widgets/app_widgets.dart';
import 'package:gym_app/workout_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../main.dart';

class FocusWorkoutScreen extends HookWidget {
  const FocusWorkoutScreen({super.key, required this.sets});
  final List<SetData> sets;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<WorkoutBloc>().add(InitializeSetsEvent(sets: sets));
      return null;
    }, []);
    final pageController = usePageController();
    return BlocPresentationListener<WorkoutBloc, WorkoutEvent>(
      listener: (context, event) {
        if (event is ChangePageEvent) {
          pageController.animateToPage(event.page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        }
      },
      child: BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
        if (state is WorkoutInProgress && state.sets.isNotEmpty) {
          return AppScaffold(
            title: "Workout",
            child: KeyboardListener(
              focusNode: FocusNode(),
              onKeyEvent: (event) {
                if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                }
              },
              child: Column(spacing: 16, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                  child: SmoothPageIndicator(
                      controller: pageController, count: state.sets.length),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: state.sets.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(children: [
                        ExerciseList(
                            exerciseIndex: index, setData: state.sets[index]),
                        if (Platform.isWindows)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: FloatingActionButton(
                              heroTag: "previousButton$index",
                              onPressed: () {
                                pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              },
                              child: const Icon(Icons.keyboard_arrow_left),
                            ),
                          ),
                        if (Platform.isWindows)
                          Align(
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton(
                              heroTag: "nextButton$index",
                              onPressed: () {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              },
                              child: const Icon(Icons.keyboard_arrow_right),
                            ),
                          )
                      ]);
                    },
                  ),
                ),
              ]),
            ),
          );
        } else if (state is WorkoutEnded) {
          return const Center(child: Text("Workout ended"));
        } else {
          return Center(
            child: Text(state.toString()),
          );
        }
      }),
    );
  }
}

class ExerciseList extends StatelessWidget {
  final int exerciseIndex;
  final SetData setData;

  const ExerciseList(
      {super.key, required this.exerciseIndex, required this.setData});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                WorkoutContainer(
                    title: setData.exercise.name,
                    width: 0.5 * constraints.maxWidth,
                    height: 0.9 * constraints.maxHeight,
                    actions: [
                      IconButton(
                        color: Theme.of(context).primaryColor,
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          context.read<WorkoutBloc>().add(
                              RemoveSetEvent(exerciseIndex: exerciseIndex));
                        },
                      ),
                      Text("Sets: ${setData.sets.length}",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          )),
                      IconButton(
                        color: Theme.of(context).primaryColor,
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          context
                              .read<WorkoutBloc>()
                              .add(AddSetEvent(exerciseIndex: exerciseIndex));
                        },
                      ),
                    ],
                    child: SetList(
                      setData: setData,
                      exerciseIndex: exerciseIndex,
                    )),
              ]),
              Column(children: [
                WorkoutContainer(
                  title: "Muscle groups",
                  width: 0.3 * constraints.maxWidth,
                  height: 0.5 * constraints.maxHeight,
                  child: ExerciseData(exercise: setData.exercise),
                ),
                WorkoutContainer(
                  title: "Statistics",
                  width: 0.3 * constraints.maxWidth,
                  height: 0.3 * constraints.maxHeight,
                  child: const SizedBox.shrink(),
                ),
              ])
            ]);
      } else {
        return Column(children: [
          WorkoutContainer(
              title: setData.exercise.name,
              width: 0.95 * constraints.maxWidth,
              height: 0.9 * constraints.maxHeight,
              actions: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    context
                        .read<WorkoutBloc>()
                        .add(RemoveSetEvent(exerciseIndex: exerciseIndex));
                  },
                ),
                Text("Sets: ${setData.sets.length}"),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    context
                        .read<WorkoutBloc>()
                        .add(AddSetEvent(exerciseIndex: exerciseIndex));
                  },
                ),
              ],
              child: SetList(
                setData: setData,
                exerciseIndex: exerciseIndex,
              )),
        ]);
      }
    });
  }
}

class ExerciseData extends StatelessWidget {
  final Exercise exercise;
  const ExerciseData({super.key, required this.exercise});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center, // Align children horizontally
      runAlignment: WrapAlignment.start,
      clipBehavior: Clip.hardEdge,
      spacing: 8,
      runSpacing: 8,
      children: exercise.muscleGroups!.map((muscle) {
        return Chip(
          label: Text(muscle.name),
        );
      }).toList(),
    );
  }
}

class WorkoutContainer extends StatelessWidget {
  final Widget child;

  final double? height;

  final double width;

  final String? title;
  final List<Widget>? actions;
  const WorkoutContainer(
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
          Expanded(child: child),
        ],
      ),
    );
  }
}

class SetList extends StatelessWidget {
  final SetData setData;

  final int exerciseIndex;

  const SetList(
      {super.key, required this.setData, required this.exerciseIndex});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: setData.sets.length,
          itemBuilder: (context, index) {
            final set = setData.sets[index];
            return SetTile(
              exerciseIndex: exerciseIndex,
              setIndex: set.setNumber,
              reps: set.repetitions ?? 0,
              weight: set.weight ?? 0,
              isCompleted: set.completed,
            );
          },
        ),
      ),
      SizedBox(
        width: 250,
        height: 75,
        child: ElevatedButton(
          onPressed: () {
            Provider.of<TimerNotifier>(context, listen: false).resetTimer();
            context
                .read<WorkoutBloc>()
                .add(CompleteSetEvent(exerciseIndex: exerciseIndex));
          },
          style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).primaryColor),
          child: const Text("Complete set"),
        ),
      )
    ]);
  }
}

class SetTile extends StatefulWidget {
  final int exerciseIndex;
  final int setIndex;
  final int reps;
  final double weight;
  final bool isCompleted;

  const SetTile({
    super.key,
    required this.setIndex,
    required this.reps,
    required this.weight,
    required this.isCompleted,
    required this.exerciseIndex,
  });

  @override
  State<SetTile> createState() => _SetTileState();
}

class _SetTileState extends State<SetTile> {
  bool isEditing = false;

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();

  @override
  dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: widget.isCompleted
          ? Colors.green.withValues(alpha: 0.5)
          : Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Column(
          children: [
            // First row (existing content for actual performance)
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: widget.isCompleted
                      ? Colors.green
                      : Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withValues(alpha: 0.5),
                  child: Text(
                    (widget.setIndex + 1).toString(),
                    style: TextStyle(
                      color: widget.isCompleted
                          ? Colors.white
                          : Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withValues(alpha: 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.fitness_center, size: 20),
                      isEditing
                          ? AppTextFormField(
                              width: 75,
                              formatters: [
                                WeightInputFormatter(),
                                LengthLimitingTextInputFormatter(7)
                              ],
                              controller: _weightController
                                ..text = widget.weight.toString(),
                            )
                          : Text(
                              widget.weight.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      const Text(' lbs'),
                      const SizedBox(width: 8),
                      const Icon(Icons.repeat, size: 20),
                      isEditing
                          ? AppTextFormField(
                              width: 40,
                              controller: _repsController
                                ..text = widget.reps.toString(),
                              formatters: [
                                RepsInputFormatter(),
                                LengthLimitingTextInputFormatter(2),
                              ],
                            )
                          : Text(
                              '${widget.reps}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      const Text(' reps'),
                    ],
                  ),
                ),
                Row(
                  children: [
                    if (widget.isCompleted)
                      const Icon(Icons.check_circle, color: Colors.green)
                    else
                      const Icon(Icons.radio_button_unchecked),
                    isEditing
                        ? IconButton(
                            onPressed: () {
                              context.read<WorkoutBloc>().add(EditSetEvent(
                                    exerciseIndex: widget.exerciseIndex,
                                    setIndex: widget.setIndex,
                                    reps: int.parse(_repsController.text),
                                    weight:
                                        double.parse(_weightController.text),
                                  ));
                              setState(() {
                                isEditing = false;
                              });
                            },
                            icon: const Icon(Icons.check),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isEditing = true;
                              });
                            },
                            icon: const Icon(Icons.edit),
                          ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                children: [
                  Text(
                    'Plan: ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    'RPE ${1}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${1}-${5} reps',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RepsInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (int.tryParse(newValue.text) == null) {
      return oldValue;
    }

    final reps = int.parse(newValue.text);
    if (reps < 0) {
      return oldValue;
    }

    return newValue;
  }
}

class WeightInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (newValue.text == '.' ||
        (newValue.text.endsWith('.') &&
            '.'.allMatches(newValue.text).length == 1)) {
      return newValue;
    }

    if (double.tryParse(newValue.text) != null) {
      final number = double.parse(newValue.text);
      if (number < 0 || number > 999) {
        return oldValue;
      }
    } else {
      return oldValue;
    }

    return newValue;
  }
}
