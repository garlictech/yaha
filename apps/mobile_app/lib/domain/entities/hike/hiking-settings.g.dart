// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiking-settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HikingSettings _$HikingSettingsFromJson(Map<String, dynamic> json) =>
    HikingSettings(
      speed: (json['speed'] as num).toDouble(),
    )..startTime = DateTime.parse(json['startTime'] as String);

Map<String, dynamic> _$HikingSettingsToJson(HikingSettings instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'startTime': instance.startTime.toIso8601String(),
    };
