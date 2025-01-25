import 'package:flutter/services.dart';

class VibrationService {
  static const platform = MethodChannel('com.example.gymapp/vibration');

  static Future<void> vibrate({int duration = 500}) async {
    try {
      await platform.invokeMethod('vibrate', {'duration': duration});
    } on PlatformException catch (e) {
      print('Failed to vibrate: ${e.message}');
    }
  }
}
