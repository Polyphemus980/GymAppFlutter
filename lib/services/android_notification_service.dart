import 'dart:io' show Platform;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const String workoutChannelId = 'workout_channel';
  static const String workoutChannelName = 'Workout Notifications';
  static const String workoutChannelDescription =
      'Notifications for workout updates';

  static Future<void> initialize(
      {Function(NotificationResponse)? onNotificationTap}) async {
    if (!Platform.isAndroid) {
      return;
    }
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await _createNotificationChannel();
  }

  static Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      workoutChannelId,
      workoutChannelName,
      description: workoutChannelDescription,
      importance: Importance.low,
      showBadge: false,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> showWorkoutNotificationWithActions() async {
    if (!Platform.isAndroid) {
      return;
    }
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      NotificationService.workoutChannelId,
      NotificationService.workoutChannelName,
      channelDescription: NotificationService.workoutChannelDescription,
      importance: Importance.low,
      priority: Priority.low,
      ongoing: true,
      autoCancel: false,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Workout in Progress',
      'Elapsed Time: 0:00',
      platformChannelSpecifics,
    );
  }

  static Future<void> updateWorkoutNotificationWithActions(
      String elapsedTime, bool isPaused) async {
    if (!Platform.isAndroid) {
      return;
    }
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      NotificationService.workoutChannelId,
      NotificationService.workoutChannelName,
      channelDescription: NotificationService.workoutChannelDescription,
      importance: Importance.low,
      priority: Priority.low,
      ongoing: true,
      autoCancel: false,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Workout in Progress',
      'Elapsed Time: $elapsedTime',
      platformChannelSpecifics,
    );
  }

  static Future<void> stopWorkoutNotification() async {
    if (!Platform.isAndroid) {
      return;
    }
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}
