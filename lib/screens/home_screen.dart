import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/services/android_vibration_service.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key, required this.db});
  final AppDatabase db;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          VibrationService.vibrate(duration: 500);
        },
        child: Text("vibrate"));
  }
}
