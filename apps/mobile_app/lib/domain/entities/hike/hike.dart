import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/utils/geometry/geocalc.dart';

import '../../game-rules.dart';
import '../shared/description.dart';
import '../shared/point.dart';
import '../shared/route.dart';

part 'hike.g.dart';

@JsonSerializable(explicitToJson: true)
class Hike {
  final String id;
  final List<Description> descriptions;
  final Route route;

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
    required this.descriptions,
    required this.route,
  });

  double get trailLength =>
      trailLength_ ??= GeoCalc.lineLength(route.coordinatesAsPoints);

  double get uphill =>
      uphill_ ??= GeoCalc.calculateUphill(route.coordinatesAsPoints);

  double get downhill =>
      downhill_ ??= GeoCalc.calculateDownhill(route.coordinatesAsPoints);

  int get difficulty =>
      difficulty_ ??= GameRules.calculateDifficulty(trailLength, uphill);

  int get score => score_ ??= GameRules.calculateScore(trailLength, uphill);

  Point get startPoint => route.startPoint;

  Point get endPoint => route.endPoint;

  String get title {
    const unknownTitle = 'Unknown Hike';
    return descriptions.isNotEmpty
        ? (descriptions.first.title ?? unknownTitle)
        : unknownTitle;
  }

  factory Hike.fromJson(Map<String, dynamic> json) => _$HikeFromJson(json);

  Map<String, dynamic> toJson() => _$HikeToJson(this);
}
