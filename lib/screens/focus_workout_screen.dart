import 'dart:io' show Platform;

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/core/domain/sets/set_data.dart';
import 'package:gym_app/core/extensions/context_extensions.dart';
import 'package:gym_app/core/services/android_notification_service.dart';
import 'package:gym_app/data/models/exercise/exercise.dart';
import 'package:gym_app/workout_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../features/theme/notifier/theme_notifier.dart';
import '../features/timer/notifier/timer_notifier.dart';

class FocusWorkoutScreen extends HookWidget {
  const FocusWorkoutScreen(
      {super.key, required this.sets, this.plannedWorkoutId});
  final List<SetData> sets;
  final String? plannedWorkoutId;
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<WorkoutBloc>().add(InitializeSetsEvent(
          sets: sets,
          userId: context.currentUserId!,
          plannedWorkoutId: plannedWorkoutId));
      return null;
    }, []);
    final pageController = usePageController();
    return BlocPresentationListener<WorkoutBloc, WorkoutEvent>(
      listener: (context, event) {
        if (event is ChangePageEvent) {
          pageController.animateToPage(event.page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        } else if (event is EndWorkoutPresentationEvent) {
          context.read<TimerNotifier>().cancelTimer();
          NotificationService.stopWorkoutNotification();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Finished workout")));
          context.go('/workout');
        } else if (event is IncorrectRepsEvent) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Set must have more than 0 repetitions")));
        }
      },
      child: BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
        if (state is WorkoutInProgress && state.sets.isNotEmpty) {
          return AppScaffold(
            title: "Workout",
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
          );
        }
        return const SizedBox.shrink();
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
                  height: 0.8 * constraints.maxHeight,
                  child: ExerciseData(exercise: setData.exercise),
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
      children: exercise.muscle_groups!.map((muscle) {
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
              isPlanned: !set.isWeight,
              rpe: set.rpe,
              minReps: set.minRepetitions,
              maxReps: set.maxRepetitions,
            );
          },
        ),
      ),
      SizedBox(
        width: 250,
        height: 75,
        child: AppInkWellButton(
          onTap: () {
            context.read<WorkoutBloc>().add(CompleteSetEvent(
                exerciseIndex: exerciseIndex,
                duration: context.read<TimerNotifier>().elapsedSeconds,
                isMetric: context.isMetric,
                onSuccess: () =>
                    Provider.of<TimerNotifier>(context, listen: false)
                        .resetTimer()));
          },
          text: "Complete set",
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
  final bool isPlanned;
  final int? minReps;
  final int? maxReps;
  final double? rpe;
  const SetTile({
    super.key,
    required this.setIndex,
    required this.reps,
    required this.weight,
    required this.isCompleted,
    required this.exerciseIndex,
    this.isPlanned = false,
    this.minReps,
    this.maxReps,
    this.rpe,
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
                          : Theme.of(context).colorScheme.onPrimary,
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
                              width: 60,
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
                      Text(context.units),
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
                              int? reps = int.tryParse(_repsController.text);
                              double? weight =
                                  double.tryParse(_weightController.text);
                              if (reps == null || reps < 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Reps must be a valid positive integer")));
                                return;
                              }
                              if (weight == null || weight < 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Weight must be a valid positive value")));
                                return;
                              }

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
            if (widget.isPlanned)
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
                      'RPE ${widget.rpe}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${widget.minReps}-${widget.maxReps} reps',
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
