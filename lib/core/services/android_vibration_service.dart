import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VibrationService {
  static const platform = MethodChannel('com.example.gymapp/vibration');

  static Future<void> vibrate({int duration = 500}) async {
    if (Platform.isAndroid) {
      try {
        await platform.invokeMethod('vibrate', {'duration': duration});
      } on PlatformException catch (e) {
        debugPrint('Failed to vibrate: ${e.message}');
      }
    }
  }
}
