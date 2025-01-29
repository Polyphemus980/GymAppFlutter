import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/features/timer/notifier/timer_notifier.dart';
import 'package:provider/provider.dart';

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
                    timerNotifier.unpauseTimer();
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
                  padding: const EdgeInsets.only(right: 8),
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
