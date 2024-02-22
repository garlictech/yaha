// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $Settings {
  const $Settings();

  Map<String, bool> get onboardingInfoShown;
  DailyReminderSetting get dailyReminder;

  Settings copyWith({
    Map<String, bool>? onboardingInfoShown,
    DailyReminderSetting? dailyReminder,
  }) =>
      Settings(
        onboardingInfoShown: onboardingInfoShown ?? this.onboardingInfoShown,
        dailyReminder: dailyReminder ?? this.dailyReminder,
      );

  Settings copyUsing(void Function(Settings$Change change) mutator) {
    final change = Settings$Change._(
      this.onboardingInfoShown,
      this.dailyReminder,
    );
    mutator(change);
    return Settings(
      onboardingInfoShown: change.onboardingInfoShown,
      dailyReminder: change.dailyReminder,
    );
  }

  @override
  String toString() =>
      "Settings(onboardingInfoShown: $onboardingInfoShown, dailyReminder: $dailyReminder)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is Settings &&
      other.runtimeType == runtimeType &&
      onboardingInfoShown == other.onboardingInfoShown &&
      dailyReminder == other.dailyReminder;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + onboardingInfoShown.hashCode;
    result = 37 * result + dailyReminder.hashCode;
    return result;
  }
}

class Settings$Change {
  Settings$Change._(
    this.onboardingInfoShown,
    this.dailyReminder,
  );

  Map<String, bool> onboardingInfoShown;
  DailyReminderSetting dailyReminder;
}

// ignore: avoid_classes_with_only_static_members
class Settings$ {
  static final onboardingInfoShown = Lens<Settings, Map<String, bool>>(
    (onboardingInfoShownContainer) =>
        onboardingInfoShownContainer.onboardingInfoShown,
    (onboardingInfoShownContainer, onboardingInfoShown) =>
        onboardingInfoShownContainer.copyWith(
            onboardingInfoShown: onboardingInfoShown),
  );

  static final dailyReminder = Lens<Settings, DailyReminderSetting>(
    (dailyReminderContainer) => dailyReminderContainer.dailyReminder,
    (dailyReminderContainer, dailyReminder) =>
        dailyReminderContainer.copyWith(dailyReminder: dailyReminder),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      onboardingInfoShown:
          (json['onboardingInfoShown'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as bool),
              ) ??
              const {},
      dailyReminder: json['dailyReminder'] == null
          ? const DailyReminderSetting()
          : DailyReminderSetting.fromJson(
              json['dailyReminder'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'onboardingInfoShown': instance.onboardingInfoShown,
      'dailyReminder': instance.dailyReminder.toJson(),
    };
