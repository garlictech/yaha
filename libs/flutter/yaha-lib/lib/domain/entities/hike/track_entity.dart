import 'package:json_annotation/json_annotation.dart';
import 'package:functional_data/functional_data.dart';

import '../../value_objects/value_objects.dart';
import 'route_entity.dart';

part 'track_entity.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class TrackEntity extends $TrackEntity {
  @override
  final String id;
  @override
  final List<Description> descriptions;
  @override
  final RouteEntity route;

  TrackEntity({
    required this.id,
    required this.descriptions,
    required this.route,
  });

  factory TrackEntity.fromJson(Map<String, dynamic> json) =>
      _$TrackEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TrackEntityToJson(this);
}
