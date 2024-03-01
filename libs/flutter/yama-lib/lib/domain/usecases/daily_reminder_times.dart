import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yama_lib/domain/entities/goal.dart';
import 'package:yama_lib/domain/usecases/ongoing_goals.dart';
import 'package:yama_lib/domain/usecases/settings.dart';

part "daily_reminder_times.g.dart";

class DailyReminderTimesState {
  final bool working;
  final List<DateTime> reminderTimes;

  DailyReminderTimesState(
      {this.working = false, this.reminderTimes = const []});
}

@riverpod
class DailyReminderTimes extends _$DailyReminderTimes {
  @override
  DailyReminderTimesState build() {
    final ongoingGoalsState = ref.watch(ongoingGoalsProvider);
    final dailyReminderTime = ref.watch(settingsControllerProvider
        .select((settings) => settings.dailyReminder));

    if (ongoingGoalsState.working) {
      return DailyReminderTimesState(working: true);
    }

    if (ongoingGoalsState.goals.isEmpty) {
      return DailyReminderTimesState(working: false, reminderTimes: []);
    }

    final lastTime = _calculateMaxDeadline(ongoingGoalsState.goals);
    final reminderTimes = _getListOfReminderTimes(
        lastTime, dailyReminderTime.hour, dailyReminderTime.minute);

    return DailyReminderTimesState(
        working: false, reminderTimes: reminderTimes);
  }

  _calculateMaxDeadline(List<Goal> goals) {
    final dates = goals.map((goal) => goal.decingDeadline).toList();
    dates.sort();
    return dates.last;
  }

  _getListOfReminderTimes(DateTime lastTime, int hour, int minute) {
    final now = DateTime.now();
    DateTime currentTime = now.copyWith(hour: hour, minute: minute);
    final List<DateTime> reminderTimes = [];

    if (currentTime.isAfter(now)) {
      reminderTimes.add(currentTime);
    }

    while (true) {
      currentTime = currentTime.add(const Duration(days: 1));

      if (currentTime.isAfter(lastTime) || reminderTimes.length > 100) {
        return reminderTimes;
      }

      reminderTimes.add(currentTime);
    }
  }
}
