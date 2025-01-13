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
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          context.read<WorkoutBloc>().add(
                              RemoveSetEvent(exerciseIndex: exerciseIndex));
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

  final double height;

  final double width;

  final String? title;
  final List<Widget>? actions;
  const WorkoutContainer(
      {super.key,
      required this.child,
      required this.width,
      required this.height,
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
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            if (title != null)
              Flexible(
                child: Text(
                  title.toString(),
                  softWrap: true,
                  style: width > 300
                      ? Theme.of(context).textTheme.headlineLarge
                      : Theme.of(context).textTheme.headlineMedium,
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
              foregroundColor: Colors.amber, backgroundColor: Colors.blue),
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      color: widget.isCompleted ? Colors.green.withOpacity(0.1) : null,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isCompleted ? Colors.green : Colors.grey.shade300,
              ),
              child: Center(
                child: Text(
                  (widget.setIndex + 1).toString(),
                  style: TextStyle(
                    color: widget.isCompleted ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.fitness_center,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  isEditing
                      ? SizedBox(
                          width: 80,
                          height: 40,
                          child: TextFormField(
                            inputFormatters: [
                              WeightInputFormatter(),
                              LengthLimitingTextInputFormatter(6),
                            ],
                            controller: _weightController
                              ..text = widget.weight.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              counter: null,
                              filled: true,
                              fillColor: Colors.blue[50],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.blueAccent,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Text(
                          widget.weight.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  const Text(' lbs'),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.repeat,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  isEditing
                      ? SizedBox(
                          width: 80,
                          height: 40,
                          child: TextFormField(
                            controller: _repsController
                              ..text = widget.reps.toString(),
                            inputFormatters: [
                              RepsInputFormatter(),
                              LengthLimitingTextInputFormatter(6),
                            ],
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            style: Theme.of(context).textTheme.titleMedium,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              filled: true,
                              fillColor: Colors.blue[50],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.blueAccent,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Text(
                          '${widget.reps}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  const Text(' reps')
                ],
              ),
            ),
            Row(
              children: [
                if (widget.isCompleted)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                else
                  const Icon(
                    Icons.radio_button_unchecked,
                  ),
                const SizedBox(width: 8),
                isEditing
                    ? IconButton(
                        onPressed: () {
                          context.read<WorkoutBloc>().add(EditSetEvent(
                              exerciseIndex: widget.exerciseIndex,
                              setIndex: widget.setIndex,
                              reps: int.parse(_repsController.text),
                              weight: double.parse(_weightController.text)));
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
      if (number < 0) {
        return oldValue;
      }
    } else {
      return oldValue;
    }

    return newValue;
  }
}
