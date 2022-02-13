import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geojson.g.dart';

@FunctionalData()
@JsonSerializable()
class GeoJsonData extends $GeoJsonData {
  @override
  final String type;
  @override
  final List<List<List<double>>> coordinates;

  GeoJsonData({
    required this.type,
    required this.coordinates,
  });

  factory GeoJsonData.fromJson(Map<String, dynamic> json) =>
      _$GeoJsonDataFromJson(json);

  Map<String, dynamic> toJson() => _$GeoJsonDataToJson(this);
}
