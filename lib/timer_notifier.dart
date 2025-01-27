import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym_app/services/android_notification_service.dart';
import 'package:gym_app/services/android_vibration_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  TimerNotifier() {
    _loadState();
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
        notifyListeners();
        if (elapsedSeconds % 90 == 0) {
          VibrationService.vibrate();
        }
        NotificationService.updateWorkoutNotificationWithActions(
            formattedElapsedTime, false);
        _saveState();
      });
      notifyListeners();
    }
  }

  void resumeTimer() {
    _isRunning = true;
    _pausedAt = null;
    _notifyTimer?.cancel();
    _notifyTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      notifyListeners();
      if (elapsedSeconds % 90 == 0) {
        VibrationService.vibrate();
      }
      NotificationService.updateWorkoutNotificationWithActions(
          formattedElapsedTime, false);
      _saveState();
    });
    notifyListeners();
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
      _deleteState();
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

  void _deleteState() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
  }

  void _saveState() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setInt('started_at', _startedAt?.millisecondsSinceEpoch ?? 0);
    sharedPrefs.setInt('paused_at', _pausedAt?.millisecondsSinceEpoch ?? 0);
    sharedPrefs.setInt('last_saved', DateTime.now().millisecondsSinceEpoch);
    sharedPrefs.setBool('is_running', _isRunning);
  }

  void _loadState() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final last_saved = sharedPrefs.getInt('last_saved');
    final last_saved_date = DateTime.fromMillisecondsSinceEpoch(last_saved!);
    print(last_saved_date.toString());
    final paused_at = sharedPrefs.getInt('paused_at');
    _pausedAt = paused_at != null
        ? DateTime.fromMillisecondsSinceEpoch(paused_at)
        : null;
    final started_at = sharedPrefs.getInt('started_at');
    _startedAt = started_at != null
        ? DateTime.fromMillisecondsSinceEpoch(started_at)
        : null;
    final is_running = sharedPrefs.getBool('is_running');
    _isRunning = is_running ?? false;

    if (_isRunning) {
      _startedAt = _startedAt!.add(DateTime.now().difference(last_saved_date));
      resumeTimer();
    }
  }

  @override
  void dispose() {
    _notifyTimer?.cancel();
    super.dispose();
  }
}
