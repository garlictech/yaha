import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../shared/geojson.dart';
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
  final GeoJson? route;
  @override
  final List<String>? imageUrls;

  Hike({
    required this.id,
    this.description,
    this.route,
    this.imageUrls,
  });

  factory Hike.fromJson(Map<String, dynamic> json) => _$HikeFromJson(json);

  Map<String, dynamic> toJson() => _$HikeToJson(this);
}
