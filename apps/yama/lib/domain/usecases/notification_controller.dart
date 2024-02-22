import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_motivate/domain/usecases/daily_reminder_times.dart';
import 'package:yama_motivate/domain/usecases/notifications.dart';
import 'package:yama_motivate/domain/usecases/settings.dart';

part 'notification_controller.g.dart';

@riverpod
class NotificationController extends _$NotificationController {
  int id = 0;

  @override
  bool build() {
    final notificationState = ref.watch(notificationsProvider);
    final notificationStateController =
        ref.watch(notificationsProvider.notifier);

    final notificationsSettings = ref.watch(settingsControllerProvider
        .select((settings) => settings.dailyReminder));

    final dailyReminderTimesState = ref.watch(dailyReminderTimesProvider);

    notificationStateController
        .handleNotificationsEnabledState(notificationsSettings.enabled);
  
    final canSetNotifications = !dailyReminderTimesState.working &&
        notificationState.granted &&
        notificationsSettings.enabled == true;

    if (canSetNotifications) {
      notificationStateController
          .resetDailyNotifications(dailyReminderTimesState.reminderTimes);
    }

    return true;
  }
}
