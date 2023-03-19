import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/domain/domain.dart';
import 'package:functional_data/functional_data.dart';

part 'route_entity.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class RouteEntity extends $RouteEntity {
  @override
  final String id;
  @override
  final List<Waypoint> coordinates;
  @override
  final List<Image> images;
  @override
  final String? municipality;

  RouteEntity(
      {required this.id,
      required this.coordinates,
      required this.images,
      this.municipality});

  factory RouteEntity.fromJson(Map<String, dynamic> json) =>
      _$RouteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RouteEntityToJson(this);
}
