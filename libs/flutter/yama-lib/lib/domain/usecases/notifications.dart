import 'dart:io';

import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications.g.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  debugPrint(title);
}

onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
  debugPrint(notificationResponse.toString());
}

initializeNotifications() async {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  const DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
}

class NotificationsState {
  final bool granted;
  final bool configured;

  NotificationsState({required this.granted, required this.configured});
}

@riverpod
class Notifications extends _$Notifications {
  int id = 0;

  @override
  NotificationsState build() {
    _configure();
    return NotificationsState(granted: false, configured: false);
  }

  getAllNotificationNumber() async {
    return await flutterLocalNotificationsPlugin.getActiveNotifications();
  }

  sendTestNotification() async {
    debugPrint("Test notification sent");
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(id++, 'Review Your Goals',
        "Take a moment to reflect on your objectives! 🎯", notificationDetails,
        payload: 'item x');
  }

  scheduleTestNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'scheduled title',
        'scheduled body',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> scheduleDailyTenAMLastYearNotification(
      String titleText, String bodyText, int hour, int minute) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        titleText,
        bodyText,
        _nextInstanceOfTenAMLastYear(hour, minute),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily notification channel id',
              'daily notification channel name',
              channelDescription: 'daily notification description'),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> _configureLocalTimeZone() async {
    if (kIsWeb || Platform.isLinux) {
      return;
    }
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  tz.TZDateTime _nextInstanceOfTenAMLastYear(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    return tz.TZDateTime(
        tz.local, now.year - 1, now.month, now.day, hour, minute);
  }

  handleNotificationsEnabledState(bool enabled) async {
    if (enabled && !state.granted) {
      await _requestPermission();
    }

    if (!state.granted) {
      return;
    }

    if (!enabled) {
      await flutterLocalNotificationsPlugin.cancelAll();
      return;
    }
  }

  _configure() async {
    await _configureLocalTimeZone();
    await _requestPermission();
    state = NotificationsState(granted: state.granted, configured: true);
  }

  _requestPermission() async {
    if (Platform.isIOS || Platform.isMacOS) {
      final result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );

      state = NotificationsState(
          granted: result ?? false, configured: state.configured);
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidImplementation?.requestNotificationsPermission();
      state = NotificationsState(
          granted: granted ?? false, configured: state.configured);
    }
  }

  _scheduleNotification(int reminderId, DateTime time) async {
    final tzDate = tz.TZDateTime(
        tz.local, time.year, time.month, time.day, time.hour, time.minute);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        reminderId,
        'Review Your Goals',
        'Take a moment to reflect on your objectives! 🎯',
        tzDate,
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime);
  }

  resetDailyNotifications(List<DateTime> reminderTimes) async {
    await flutterLocalNotificationsPlugin.cancelAll();
    int reminderId = 0;

    for (final reminder in reminderTimes) {
      await _scheduleNotification(reminderId++, reminder);
    }
  }
}
