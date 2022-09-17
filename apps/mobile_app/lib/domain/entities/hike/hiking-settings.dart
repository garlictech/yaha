import 'package:json_annotation/json_annotation.dart';

part 'hiking-settings.g.dart';

@JsonSerializable(explicitToJson: true)
class HikingSettings {
  final double speed;
  late final DateTime startTime;

  HikingSettings({required this.speed})
      : startTime = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 5, 0);

  factory HikingSettings.fromJson(Map<String, dynamic> json) =>
      _$HikingSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HikingSettingsToJson(this);
}
