// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_reminder_setting.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $DailyReminderSetting {
  const $DailyReminderSetting();

  int get hour;
  int get minute;
  bool get enabled;

  DailyReminderSetting copyWith({
    int? hour,
    int? minute,
    bool? enabled,
  }) =>
      DailyReminderSetting(
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
        enabled: enabled ?? this.enabled,
      );

  DailyReminderSetting copyUsing(
      void Function(DailyReminderSetting$Change change) mutator) {
    final change = DailyReminderSetting$Change._(
      this.hour,
      this.minute,
      this.enabled,
    );
    mutator(change);
    return DailyReminderSetting(
      hour: change.hour,
      minute: change.minute,
      enabled: change.enabled,
    );
  }

  @override
  String toString() =>
      "DailyReminderSetting(hour: $hour, minute: $minute, enabled: $enabled)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is DailyReminderSetting &&
      other.runtimeType == runtimeType &&
      hour == other.hour &&
      minute == other.minute &&
      enabled == other.enabled;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + hour.hashCode;
    result = 37 * result + minute.hashCode;
    result = 37 * result + enabled.hashCode;
    return result;
  }
}

class DailyReminderSetting$Change {
  DailyReminderSetting$Change._(
    this.hour,
    this.minute,
    this.enabled,
  );

  int hour;
  int minute;
  bool enabled;
}

// ignore: avoid_classes_with_only_static_members
class DailyReminderSetting$ {
  static final hour = Lens<DailyReminderSetting, int>(
    (hourContainer) => hourContainer.hour,
    (hourContainer, hour) => hourContainer.copyWith(hour: hour),
  );

  static final minute = Lens<DailyReminderSetting, int>(
    (minuteContainer) => minuteContainer.minute,
    (minuteContainer, minute) => minuteContainer.copyWith(minute: minute),
  );

  static final enabled = Lens<DailyReminderSetting, bool>(
    (enabledContainer) => enabledContainer.enabled,
    (enabledContainer, enabled) => enabledContainer.copyWith(enabled: enabled),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyReminderSetting _$DailyReminderSettingFromJson(
        Map<String, dynamic> json) =>
    DailyReminderSetting(
      hour: json['hour'] as int? ?? 10,
      minute: json['minute'] as int? ?? 0,
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$DailyReminderSettingToJson(
        DailyReminderSetting instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'enabled': instance.enabled,
    };
