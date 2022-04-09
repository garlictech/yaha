import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/utils/geometry/geocalc.dart';

import '../shared/linestring.dart';
import '../shared/textual-description.dart';

part 'hike.g.dart';

@JsonSerializable()
class Hike {
  final String id;
  final List<TextualDescription> description;
  final LineStringData route;

  @JsonKey(ignore: true)
  double? trailLength_;

  Hike({
    required this.id,
    required this.description,
    required this.route,
  });

  double get trailLength =>
      trailLength_ ??= GeoCalc.lineLength(route.coordinates);

  factory Hike.fromJson(Map<String, dynamic> json) => _$HikeFromJson(json);

  Map<String, dynamic> toJson() => _$HikeToJson(this);
}
