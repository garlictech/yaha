import 'package:json_annotation/json_annotation.dart';
import 'package:functional_data/functional_data.dart';
import 'package:yaha/domain/entities/poi/poi_type.dart';

part 'hiking_settings.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class HikingSettings extends $HikingSettings {
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

  HikingSettings({
    required this.speed,
    required this.startTime,
    required this.reversedHike,
    this.filteredPoiTypes = const [],
    this.showAllPoisAlongHike = false,
    this.showPoisAroundHike = false,
  });

  factory HikingSettings.fromJson(Map<String, dynamic> json) =>
      _$HikingSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HikingSettingsToJson(this);
}
