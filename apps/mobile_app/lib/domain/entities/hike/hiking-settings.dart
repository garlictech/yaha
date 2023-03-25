import 'package:json_annotation/json_annotation.dart';
import 'package:functional_data/functional_data.dart';

part 'hiking-settings.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class HikingSettings extends $HikingSettings {
  @override
  final double speed;
  @override
  final DateTime startTime;

  HikingSettings({required this.speed, required this.startTime});

  factory HikingSettings.fromJson(Map<String, dynamic> json) =>
      _$HikingSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HikingSettingsToJson(this);
}
