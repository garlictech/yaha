import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_reminder_setting.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class DailyReminderSetting extends $DailyReminderSetting {
  @override
  final int hour;
  @override
  final int minute;
  @override
  final bool enabled;

  const DailyReminderSetting(
      {this.hour = 10, this.minute = 0, this.enabled = true});

  factory DailyReminderSetting.fromJson(Map<String, dynamic> json) =>
      _$DailyReminderSettingFromJson(json);

  Map<String, dynamic> toJson() => _$DailyReminderSettingToJson(this);
}
