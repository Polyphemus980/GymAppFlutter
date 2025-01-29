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
import 'package:gym_app/features/workouts/blocs/workout_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../timer/notifier/timer_notifier.dart';
import '../widgets/focus_workout_screen_widgets.dart';

class FocusWorkoutScreen extends HookWidget {
  const FocusWorkoutScreen(
      {super.key, required this.sets, this.plannedWorkoutId,});
  final List<SetData> sets;
  final String? plannedWorkoutId;
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<WorkoutBloc>().add(InitializeSetsEvent(
          sets: sets,
          userId: context.currentUserId!,
          plannedWorkoutId: plannedWorkoutId,),);
      return null;
    }, [],);
    final pageController = usePageController();
    return BlocPresentationListener<WorkoutBloc, WorkoutEvent>(
      listener: (context, event) {
        if (event is ChangePageEvent) {
          pageController.animateToPage(event.page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,);
        } else if (event is EndWorkoutPresentationEvent) {
          context.read<TimerNotifier>().cancelTimer();
          NotificationService.stopWorkoutNotification();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Finished workout')));
          context.go('/workout');
        } else if (event is IncorrectRepsEvent) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Set must have more than 0 repetitions'),),);
        }
      },
      child: BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
        if (state is WorkoutInProgress && state.sets.isNotEmpty) {
          return AppScaffold(
            title: 'Workout',
            child: Column(spacing: 16, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: SmoothPageIndicator(
                    controller: pageController, count: state.sets.length,),
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: state.sets.length,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      ExerciseList(
                          exerciseIndex: index, setData: state.sets[index],),
                      if (Platform.isWindows)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FloatingActionButton(
                            heroTag: 'previousButton$index',
                            onPressed: () {
                              pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,);
                            },
                            child: const Icon(Icons.keyboard_arrow_left),
                          ),
                        ),
                      if (Platform.isWindows)
                        Align(
                          alignment: Alignment.centerRight,
                          child: FloatingActionButton(
                            heroTag: 'nextButton$index',
                            onPressed: () {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,);
                            },
                            child: const Icon(Icons.keyboard_arrow_right),
                          ),
                        ),
                    ],);
                  },
                ),
              ),
            ],),
          );
        }
        return const SizedBox.shrink();
      },),
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
