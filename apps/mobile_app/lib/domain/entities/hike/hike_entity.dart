import 'package:json_annotation/json_annotation.dart';
import 'package:functional_data/functional_data.dart';

import '../shared/description.dart';
import '../shared/route_entity.dart';

part 'hike_entity.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class HikeEntity extends $HikeEntity {
  @override
  final String id;
  @override
  final List<Description> descriptions;
  @override
  final RouteEntity route;

  HikeEntity({
    required this.id,
    required this.descriptions,
    required this.route,
  });

  factory HikeEntity.fromJson(Map<String, dynamic> json) =>
      _$HikeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HikeEntityToJson(this);
}
