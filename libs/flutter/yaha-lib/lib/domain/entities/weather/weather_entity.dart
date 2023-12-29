import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_entity.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class WeatherEntity extends $WeatherEntity {
  @override
  final DateTime when;
  @override
  final String type;

  WeatherEntity({
    required this.when,
    required this.type,
  });

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntityToJson(this);
}
