import 'dart:async';

import 'package:flutter/material.dart';

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
      _notifyTimer =
          Timer.periodic(const Duration(seconds: 1), (_) => notifyListeners());
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

  pauseTimer() {
    if (_isRunning) {
      _pausedAt = DateTime.now();
      _isRunning = false;
      _notifyTimer?.cancel();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _notifyTimer?.cancel();
    super.dispose();
  }
}
