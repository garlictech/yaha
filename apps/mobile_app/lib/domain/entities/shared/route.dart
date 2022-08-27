import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/domain/domain.dart';

part 'route.g.dart';

@FunctionalData()
@JsonSerializable()
class Route extends $Route {
  @override
  final String externalId;
  @override
  final List<Waypoint> coordinates;
  @override
  final Waypoint startPoint;
  @override
  final Waypoint endPoint;

  const Route({
    required this.externalId,
    required this.coordinates,
    required this.startPoint,
    required this.endPoint,
  });

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  Map<String, dynamic> toJson() => _$RouteToJson(this);
}
