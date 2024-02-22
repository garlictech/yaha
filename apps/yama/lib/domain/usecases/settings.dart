import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_motivate/data/repositories/settings.repository.service.dart';

import '../entities/settings.dart';

part 'settings.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  Settings build() {
    final settingsRepo = ref.read(settingsRepositoryServiceProvider);

    settingsRepo?.fetch().then((settings) {
      if (settings != null) {
        state = settings;
      }
    });

    return Settings();
  }

  updateSettings(Settings settings) async {
    final settingsRepo = ref.read(settingsRepositoryServiceProvider);
    await settingsRepo?.store(settings);
    state = settings;
  }

  toggleOnboardingItem(String key) async {
    if (state == null) {
      return;
    }

    final currentValue = state.isOnboardingAlreadyShown(key);
    final newOnboardingSettings = {
      ...state.onboardingInfoShown,
      key: !currentValue
    };
    await updateSettings(
        state.copyWith(onboardingInfoShown: newOnboardingSettings));
  }

  setDailyNotificationsEnabled(bool value) async {
    if (state == null) {
      return;
    }

    await updateSettings(state.copyWith(
        dailyReminder: state.dailyReminder.copyWith(enabled: value)));

    debugPrint("SETTINGS STATE $state");
  }

  setDailyReminderTime(TimeOfDay time) async {
    if (state == null) {
      return;
    }

    await updateSettings(state.copyWith(
        dailyReminder: state.dailyReminder
            .copyWith(hour: time.hour, minute: time.minute)));
  }
}
