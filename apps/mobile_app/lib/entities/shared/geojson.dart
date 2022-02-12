import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geojson.g.dart';

@FunctionalData()
@JsonSerializable()
class GeoJson extends $GeoJson {
  @override
  final String type;
  @override
  final List<List<List<double>>> coordinates;

  GeoJson({
    required this.type,
    required this.coordinates,
  });

  factory GeoJson.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonFromJson(json);

  Map<String, dynamic> toJson() => _$GeoJsonToJson(this);
}
