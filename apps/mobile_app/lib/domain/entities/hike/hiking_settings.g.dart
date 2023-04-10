// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiking_settings.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $HikingSettings {
  const $HikingSettings();

  double get speed;
  DateTime get startTime;
  bool get reversedHike;
  List<PoiType> get filteredPoiTypes;
  bool get showAllPoisAlongHike;

  HikingSettings copyWith({
    double? speed,
    DateTime? startTime,
    bool? reversedHike,
    List<PoiType>? filteredPoiTypes,
    bool? showAllPoisAlongHike,
  }) =>
      HikingSettings(
        speed: speed ?? this.speed,
        startTime: startTime ?? this.startTime,
        reversedHike: reversedHike ?? this.reversedHike,
        filteredPoiTypes: filteredPoiTypes ?? this.filteredPoiTypes,
        showAllPoisAlongHike: showAllPoisAlongHike ?? this.showAllPoisAlongHike,
      );

  HikingSettings copyUsing(
      void Function(HikingSettings$Change change) mutator) {
    final change = HikingSettings$Change._(
      this.speed,
      this.startTime,
      this.reversedHike,
      this.filteredPoiTypes,
      this.showAllPoisAlongHike,
    );
    mutator(change);
    return HikingSettings(
      speed: change.speed,
      startTime: change.startTime,
      reversedHike: change.reversedHike,
      filteredPoiTypes: change.filteredPoiTypes,
      showAllPoisAlongHike: change.showAllPoisAlongHike,
    );
  }

  @override
  String toString() =>
      "HikingSettings(speed: $speed, startTime: $startTime, reversedHike: $reversedHike, filteredPoiTypes: $filteredPoiTypes, showAllPoisAlongHike: $showAllPoisAlongHike)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is HikingSettings &&
      other.runtimeType == runtimeType &&
      speed == other.speed &&
      startTime == other.startTime &&
      reversedHike == other.reversedHike &&
      filteredPoiTypes == other.filteredPoiTypes &&
      showAllPoisAlongHike == other.showAllPoisAlongHike;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + speed.hashCode;
    result = 37 * result + startTime.hashCode;
    result = 37 * result + reversedHike.hashCode;
    result = 37 * result + filteredPoiTypes.hashCode;
    result = 37 * result + showAllPoisAlongHike.hashCode;
    return result;
  }
}

class HikingSettings$Change {
  HikingSettings$Change._(
    this.speed,
    this.startTime,
    this.reversedHike,
    this.filteredPoiTypes,
    this.showAllPoisAlongHike,
  );

  double speed;
  DateTime startTime;
  bool reversedHike;
  List<PoiType> filteredPoiTypes;
  bool showAllPoisAlongHike;
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

  static final reversedHike = Lens<HikingSettings, bool>(
    (reversedHikeContainer) => reversedHikeContainer.reversedHike,
    (reversedHikeContainer, reversedHike) =>
        reversedHikeContainer.copyWith(reversedHike: reversedHike),
  );

  static final filteredPoiTypes = Lens<HikingSettings, List<PoiType>>(
    (filteredPoiTypesContainer) => filteredPoiTypesContainer.filteredPoiTypes,
    (filteredPoiTypesContainer, filteredPoiTypes) =>
        filteredPoiTypesContainer.copyWith(filteredPoiTypes: filteredPoiTypes),
  );

  static final showAllPoisAlongHike = Lens<HikingSettings, bool>(
    (showAllPoisAlongHikeContainer) =>
        showAllPoisAlongHikeContainer.showAllPoisAlongHike,
    (showAllPoisAlongHikeContainer, showAllPoisAlongHike) =>
        showAllPoisAlongHikeContainer.copyWith(
            showAllPoisAlongHike: showAllPoisAlongHike),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HikingSettings _$HikingSettingsFromJson(Map<String, dynamic> json) =>
    HikingSettings(
      speed: (json['speed'] as num).toDouble(),
      startTime: DateTime.parse(json['startTime'] as String),
      reversedHike: json['reversedHike'] as bool,
      filteredPoiTypes: (json['filteredPoiTypes'] as List<dynamic>?)
              ?.map((e) => PoiType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      showAllPoisAlongHike: json['showAllPoisAlongHike'] as bool? ?? false,
    );

Map<String, dynamic> _$HikingSettingsToJson(HikingSettings instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'startTime': instance.startTime.toIso8601String(),
      'reversedHike': instance.reversedHike,
      'filteredPoiTypes':
          instance.filteredPoiTypes.map((e) => e.toJson()).toList(),
      'showAllPoisAlongHike': instance.showAllPoisAlongHike,
    };
