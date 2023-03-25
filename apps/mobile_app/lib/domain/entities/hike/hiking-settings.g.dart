// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiking-settings.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $HikingSettings {
  const $HikingSettings();

  double get speed;
  DateTime get startTime;

  HikingSettings copyWith({
    double? speed,
    DateTime? startTime,
  }) =>
      HikingSettings(
        speed: speed ?? this.speed,
        startTime: startTime ?? this.startTime,
      );

  HikingSettings copyUsing(
      void Function(HikingSettings$Change change) mutator) {
    final change = HikingSettings$Change._(
      this.speed,
      this.startTime,
    );
    mutator(change);
    return HikingSettings(
      speed: change.speed,
      startTime: change.startTime,
    );
  }

  @override
  String toString() => "HikingSettings(speed: $speed, startTime: $startTime)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is HikingSettings &&
      other.runtimeType == runtimeType &&
      speed == other.speed &&
      startTime == other.startTime;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + speed.hashCode;
    result = 37 * result + startTime.hashCode;
    return result;
  }
}

class HikingSettings$Change {
  HikingSettings$Change._(
    this.speed,
    this.startTime,
  );

  double speed;
  DateTime startTime;
}

// ignore: avoid_classes_with_only_static_members
class HikingSettings$ {
  static final speed = Lens<HikingSettings, double>(
    (speedContainer) => speedContainer.speed,
    (speedContainer, speed) => speedContainer.copyWith(speed: speed),
  );

  static final startTime = Lens<HikingSettings, DateTime>(
    (startTimeContainer) => startTimeContainer.startTime,
    (startTimeContainer, startTime) =>
        startTimeContainer.copyWith(startTime: startTime),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HikingSettings _$HikingSettingsFromJson(Map<String, dynamic> json) =>
    HikingSettings(
      speed: (json['speed'] as num).toDouble(),
      startTime: DateTime.parse(json['startTime'] as String),
    );

Map<String, dynamic> _$HikingSettingsToJson(HikingSettings instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'startTime': instance.startTime.toIso8601String(),
    };
