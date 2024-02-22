import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yama_motivate/domain/entities/daily_reminder_setting.dart';
import 'package:yama_motivate/domain/usecases/notifications.dart';
import 'package:yama_motivate/domain/usecases/settings.dart';
import 'package:yama_motivate/domain/usecases/test_mode.dart';
import 'package:yama_motivate/l10n/app_localizations.dart';

class DailyReminderSettings extends ConsumerWidget {
  const DailyReminderSettings({super.key});
  static const defaultNotificationSettings = DailyReminderSetting();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTestMode = ref.watch(testModeProvider);
    final dailyReminderSettings = ref.watch(settingsControllerProvider
        .select((settings) => settings.dailyReminder));
    final settingsNotifier = ref.read(settingsControllerProvider.notifier);
    final currentHour =
        dailyReminderSettings.hour ?? defaultNotificationSettings.hour;
    final currentMinute =
        dailyReminderSettings.minute ?? defaultNotificationSettings.minute;
    final notificationsEnabled =
        dailyReminderSettings.enabled ?? defaultNotificationSettings.enabled;

    onDailyTimeButtonPressed() async {
      final newNotificationTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: currentHour, minute: currentMinute));

      if (newNotificationTime != null) {
        settingsNotifier.setDailyReminderTime(newNotificationTime);
      }
    }

    onNotificationsEnabledPressed(bool value) {
      settingsNotifier.setDailyNotificationsEnabled(value);
    }

    return ListView(shrinkWrap: true, children: [
      ListTile(
        title: Text(AppLocalizations.of(context)!.enableNotifications),
        trailing: Switch(
          value: notificationsEnabled,
          onChanged: (value) {
            onNotificationsEnabledPressed(value);
          },
        ),
      ),
      ListTile(
          title: Text(AppLocalizations.of(context)!.dailyReminderTime),
          trailing: ElevatedButton(
              onPressed: onDailyTimeButtonPressed,
              child: Text(
                  "${_formatTime(currentHour)}:${_formatTime(currentMinute)}"))),
      if (isTestMode)
        Column(children: [
          ElevatedButton(
              onPressed: () {
                ref.read(notificationsProvider.notifier).sendTestNotification();
              },
              child: const Text("Send test notification")),
          ElevatedButton(
              onPressed: () {
                ref
                    .read(notificationsProvider.notifier)
                    .scheduleTestNotification();
              },
              child: const Text("Schedule notification"))
        ])
    ]);
  }

  Future<TimeOfDay?> displayTimePicker(BuildContext context) async {
    return showTimePicker(
        context: context, initialTime: const TimeOfDay(hour: 10, minute: 0));
  }

  _formatTime(int val) {
    return val.toString().padLeft(2, '0');
  }
}
