// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiking_settings_entity.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $HikingSettingsEntity {
  const $HikingSettingsEntity();

  double get speed;
  DateTime get startTime;
  bool get reversedHike;
  List<PoiType> get filteredPoiTypes;
  bool get showAllPoisAlongHike;
  bool get showPoisAroundHike;

  HikingSettingsEntity copyWith({
    double? speed,
    DateTime? startTime,
    bool? reversedHike,
    List<PoiType>? filteredPoiTypes,
    bool? showAllPoisAlongHike,
    bool? showPoisAroundHike,
  }) =>
      HikingSettingsEntity(
        speed: speed ?? this.speed,
        startTime: startTime ?? this.startTime,
        reversedHike: reversedHike ?? this.reversedHike,
        filteredPoiTypes: filteredPoiTypes ?? this.filteredPoiTypes,
        showAllPoisAlongHike: showAllPoisAlongHike ?? this.showAllPoisAlongHike,
        showPoisAroundHike: showPoisAroundHike ?? this.showPoisAroundHike,
      );

  HikingSettingsEntity copyUsing(
      void Function(HikingSettingsEntity$Change change) mutator) {
    final change = HikingSettingsEntity$Change._(
      this.speed,
      this.startTime,
      this.reversedHike,
      this.filteredPoiTypes,
      this.showAllPoisAlongHike,
      this.showPoisAroundHike,
    );
    mutator(change);
    return HikingSettingsEntity(
      speed: change.speed,
      startTime: change.startTime,
      reversedHike: change.reversedHike,
      filteredPoiTypes: change.filteredPoiTypes,
      showAllPoisAlongHike: change.showAllPoisAlongHike,
      showPoisAroundHike: change.showPoisAroundHike,
    );
  }

  @override
  String toString() =>
      "HikingSettingsEntity(speed: $speed, startTime: $startTime, reversedHike: $reversedHike, filteredPoiTypes: $filteredPoiTypes, showAllPoisAlongHike: $showAllPoisAlongHike, showPoisAroundHike: $showPoisAroundHike)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is HikingSettingsEntity &&
      other.runtimeType == runtimeType &&
      speed == other.speed &&
      startTime == other.startTime &&
      reversedHike == other.reversedHike &&
      filteredPoiTypes == other.filteredPoiTypes &&
      showAllPoisAlongHike == other.showAllPoisAlongHike &&
      showPoisAroundHike == other.showPoisAroundHike;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + speed.hashCode;
    result = 37 * result + startTime.hashCode;
    result = 37 * result + reversedHike.hashCode;
    result = 37 * result + filteredPoiTypes.hashCode;
    result = 37 * result + showAllPoisAlongHike.hashCode;
    result = 37 * result + showPoisAroundHike.hashCode;
    return result;
  }
}

class HikingSettingsEntity$Change {
  HikingSettingsEntity$Change._(
    this.speed,
    this.startTime,
    this.reversedHike,
    this.filteredPoiTypes,
    this.showAllPoisAlongHike,
    this.showPoisAroundHike,
  );

  double speed;
  DateTime startTime;
  bool reversedHike;
  List<PoiType> filteredPoiTypes;
  bool showAllPoisAlongHike;
  bool showPoisAroundHike;
}

// ignore: avoid_classes_with_only_static_members
class HikingSettingsEntity$ {
  static final speed = Lens<HikingSettingsEntity, double>(
    (speedContainer) => speedContainer.speed,
    (speedContainer, speed) => speedContainer.copyWith(speed: speed),
  );

  static final startTime = Lens<HikingSettingsEntity, DateTime>(
    (startTimeContainer) => startTimeContainer.startTime,
    (startTimeContainer, startTime) =>
        startTimeContainer.copyWith(startTime: startTime),
  );

  static final reversedHike = Lens<HikingSettingsEntity, bool>(
    (reversedHikeContainer) => reversedHikeContainer.reversedHike,
    (reversedHikeContainer, reversedHike) =>
        reversedHikeContainer.copyWith(reversedHike: reversedHike),
  );

  static final filteredPoiTypes = Lens<HikingSettingsEntity, List<PoiType>>(
    (filteredPoiTypesContainer) => filteredPoiTypesContainer.filteredPoiTypes,
    (filteredPoiTypesContainer, filteredPoiTypes) =>
        filteredPoiTypesContainer.copyWith(filteredPoiTypes: filteredPoiTypes),
  );

  static final showAllPoisAlongHike = Lens<HikingSettingsEntity, bool>(
    (showAllPoisAlongHikeContainer) =>
        showAllPoisAlongHikeContainer.showAllPoisAlongHike,
    (showAllPoisAlongHikeContainer, showAllPoisAlongHike) =>
        showAllPoisAlongHikeContainer.copyWith(
            showAllPoisAlongHike: showAllPoisAlongHike),
  );

  static final showPoisAroundHike = Lens<HikingSettingsEntity, bool>(
    (showPoisAroundHikeContainer) =>
        showPoisAroundHikeContainer.showPoisAroundHike,
    (showPoisAroundHikeContainer, showPoisAroundHike) =>
        showPoisAroundHikeContainer.copyWith(
            showPoisAroundHike: showPoisAroundHike),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HikingSettingsEntity _$HikingSettingsEntityFromJson(
        Map<String, dynamic> json) =>
    HikingSettingsEntity(
      speed: (json['speed'] as num).toDouble(),
      startTime: DateTime.parse(json['startTime'] as String),
      reversedHike: json['reversedHike'] as bool,
      filteredPoiTypes: (json['filteredPoiTypes'] as List<dynamic>?)
              ?.map((e) => PoiType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      showAllPoisAlongHike: json['showAllPoisAlongHike'] as bool? ?? false,
      showPoisAroundHike: json['showPoisAroundHike'] as bool? ?? false,
    );

Map<String, dynamic> _$HikingSettingsEntityToJson(
        HikingSettingsEntity instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'startTime': instance.startTime.toIso8601String(),
      'reversedHike': instance.reversedHike,
      'filteredPoiTypes':
          instance.filteredPoiTypes.map((e) => e.toJson()).toList(),
      'showAllPoisAlongHike': instance.showAllPoisAlongHike,
      'showPoisAroundHike': instance.showPoisAroundHike,
    };
