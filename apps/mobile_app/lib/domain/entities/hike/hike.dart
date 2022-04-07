import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../shared/linestring.dart';
import '../shared/textual-description.dart';

part 'hike.g.dart';

@FunctionalData()
@JsonSerializable()
class Hike extends $Hike {
  @override
  final String id;
  @override
  final List<TextualDescription>? description;
  @override
  final LineStringData? route;

  Hike({
    required this.id,
    this.description,
    this.route,
  });

  factory Hike.fromJson(Map<String, dynamic> json) => _$HikeFromJson(json);

  Map<String, dynamic> toJson() => _$HikeToJson(this);
}
