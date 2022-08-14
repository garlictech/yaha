import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'bounding_box.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class BoundingBox extends $BoundingBox {
  @override
  final Location SouthWest;
  @override
  final Location NorthEast;

  const BoundingBox({
    required this.SouthWest,
    required this.NorthEast,
  });

  factory BoundingBox.fromJson(Map<String, dynamic> json) =>
      _$BoundingBoxFromJson(json);

  Map<String, dynamic> toJson() => _$BoundingBoxToJson(this);
}
