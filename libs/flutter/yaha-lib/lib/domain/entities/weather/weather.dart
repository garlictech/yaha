import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class Weather extends $Weather {
  @override
  final DateTime when;
  @override
  final String type;

  Weather({
    required this.when,
    required this.type,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
