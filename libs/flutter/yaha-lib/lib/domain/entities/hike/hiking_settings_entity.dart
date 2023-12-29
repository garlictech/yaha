import 'package:json_annotation/json_annotation.dart';
import 'package:functional_data/functional_data.dart';

import '../../value_objects/value_objects.dart';

part 'hiking_settings_entity.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class HikingSettingsEntity extends $HikingSettingsEntity {
  @override
  final double speed;
  @override
  final DateTime startTime;
  @override
  final bool reversedHike;
  @override
  final List<PoiType> filteredPoiTypes;
  @override
  final bool showAllPoisAlongHike;
  @override
  final bool showPoisAroundHike;

  HikingSettingsEntity({
    required this.speed,
    required this.startTime,
    required this.reversedHike,
    this.filteredPoiTypes = const [],
    this.showAllPoisAlongHike = false,
    this.showPoisAroundHike = false,
  });

  factory HikingSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$HikingSettingsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HikingSettingsEntityToJson(this);
}
