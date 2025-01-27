import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/timer_notifier.dart';
import 'package:provider/provider.dart';

import '../workout_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(this.child, {super.key});
  final Widget child;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (BuildContext context, state) {
          if (state is WorkoutInProgress) {
            return const TimerFAB();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Train',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Theme.of(context)
            .colorScheme
            .primary, // Use accentColor from the theme
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              context.go('/workout');
            case 1:
              context.go('/train');
            case 2:
              context.go('/profile');
          }
        },
      ),
      body: widget.child,
    );
  }
}

class TimerFAB extends StatelessWidget {
  const TimerFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerNotifier>(
      builder: (context, timerNotifier, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Timer controls that appear when expanded
            if (timerNotifier.isExpanded) ...[
              FloatingActionButton(
                heroTag: 'reset',
                mini: true,
                onPressed: timerNotifier.resetTimer,
                child: const Icon(Icons.refresh),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                heroTag: 'playPause',
                mini: true,
                onPressed: () {
                  if (timerNotifier.isRunning) {
                    timerNotifier.pauseTimer();
                  } else {
                    timerNotifier.startTimer();
                  }
                },
                child: Icon(
                  timerNotifier.isRunning ? Icons.pause : Icons.play_arrow,
                ),
              ),
              const SizedBox(height: 8),
            ],
            // Main FAB for navigation and expanding controls
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Timer display and control toggle
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FloatingActionButton.small(
                    heroTag: 'expand',
                    onPressed: timerNotifier.toggleExpanded,
                    child: Icon(
                      timerNotifier.isExpanded
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                    ),
                  ),
                ),
                // Navigation FAB
                FloatingActionButton.extended(
                  heroTag: 'navigate',
                  onPressed: () => context.go('/start'),
                  icon: const Icon(Icons.fitness_center),
                  label: Text(
                    timerNotifier.formattedElapsedTime,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
