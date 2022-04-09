import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/utils/geometry/geocalc.dart';

import '../../game-rules.dart';
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

  @JsonKey(ignore: true)
  double? uphill_;

  @JsonKey(ignore: true)
  double? downhill_;

  @JsonKey(ignore: true)
  int? difficulty_;

  @JsonKey(ignore: true)
  int? score_;

  Hike({
    required this.id,
    required this.description,
    required this.route,
  });

  double get trailLength =>
      trailLength_ ??= GeoCalc.lineLength(route.coordinates);

  double get uphill => uphill_ ??= GeoCalc.calculateUphill(route.coordinates);

  double get downhill =>
      downhill_ ??= GeoCalc.calculateDownhill(route.coordinates);

  int get difficulty =>
      difficulty_ ??= GameRules.calculateDifficulty(trailLength, uphill);

  int get score => score_ ??= GameRules.calculateScore(trailLength, uphill);

  factory Hike.fromJson(Map<String, dynamic> json) => _$HikeFromJson(json);

  Map<String, dynamic> toJson() => _$HikeToJson(this);
}
