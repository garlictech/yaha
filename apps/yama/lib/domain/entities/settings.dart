import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'daily_reminder_setting.dart';

part 'settings.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class Settings extends $Settings {
  @override
  final Map<String, bool> onboardingInfoShown;
  @override
  final DailyReminderSetting dailyReminder;

  Settings(
      {this.onboardingInfoShown = const {},
      this.dailyReminder = const DailyReminderSetting()});

  isOnboardingAlreadyShown(String key) {
    return onboardingInfoShown[key] == true;
  }

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
