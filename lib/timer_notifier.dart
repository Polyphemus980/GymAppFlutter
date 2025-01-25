import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym_app/services/android_notification_service.dart';
import 'package:gym_app/services/android_vibration_service.dart';

class TimerNotifier extends ChangeNotifier {
  DateTime? _startedAt;
  DateTime? _pausedAt;
  bool _isRunning = false;
  Timer? _notifyTimer;
  int get elapsedSeconds {
    if (_startedAt == null) {
      return 0;
    }
    if (!_isRunning && _pausedAt != null) {
      return _pausedAt!.difference(_startedAt!).inSeconds;
    }
    return DateTime.now().difference(_startedAt!).inSeconds;
  }

  String get formattedElapsedTime {
    final seconds = elapsedSeconds;
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  startTimer() {
    if (!_isRunning) {
      if (_startedAt == null) {
        _startedAt = DateTime.now();
      } else {
        _startedAt = _startedAt!.add(DateTime.now().difference(_pausedAt!));
      }
      _isRunning = true;
      _pausedAt = null;
      _notifyTimer?.cancel();
      _notifyTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (elapsedSeconds % 90 == 0) VibrationService.vibrate();
        notifyListeners();
        NotificationService.updateWorkoutNotificationWithActions(
            formattedElapsedTime, false);
      });
      notifyListeners();
    }
  }

  resetTimer() {
    if (!_isRunning) {
      return;
    }
    _startedAt = DateTime.now();
    _pausedAt = null;
    notifyListeners();
  }

  cancelTimer() {
    if (_isRunning) {
      _notifyTimer?.cancel();
      _pausedAt = null;
      _startedAt = null;
      _isRunning = false;
      _notifyTimer?.cancel();
      NotificationService.stopWorkoutNotification();
      notifyListeners();
    }
  }

  pauseTimer() {
    if (_isRunning) {
      _pausedAt = DateTime.now();
      _isRunning = false;
      _notifyTimer?.cancel();
      NotificationService.updateWorkoutNotificationWithActions(
          formattedElapsedTime, true);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _notifyTimer?.cancel();
    super.dispose();
  }
}
