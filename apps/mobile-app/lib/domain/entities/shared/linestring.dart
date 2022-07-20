import 'dart:convert';

import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'linestring.g.dart';

@FunctionalData()
@JsonSerializable()
class LineStringData extends $LineStringData {
  @override
  final String type;
  @override
  final List<List<double>> coordinates;

  LineStringData({
    required this.type,
    required this.coordinates,
  });

  factory LineStringData.fromJson(Map<String, dynamic> json) =>
      _$LineStringDataFromJson(json);

  Map<String, dynamic> toJson() => _$LineStringDataToJson(this);

  String toGeojsonFeatureString([String? name]) => '''
    {
      "features": [
        {
        "type": "Feature",
        "geometry": ${jsonEncode(toJson())}
      }]
    }
    ''';

  String toLinestringFeatureString() => '''
    {
        "type": "Feature",
        "geometry": ${jsonEncode(toJson())}
    }
    ''';
}
