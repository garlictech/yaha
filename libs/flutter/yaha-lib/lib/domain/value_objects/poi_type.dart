import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poi_type.g.dart';

@FunctionalData()
@JsonSerializable(explicitToJson: true)
class PoiType extends $PoiType implements Comparable<PoiType> {
  @override
  final String category;
  @override
  final String kind;

  const PoiType({required this.category, required this.kind});

  @override
  int compareTo(PoiType other) {
    return "$category$kind".compareTo("${other.category}${other.kind}");
  }

  factory PoiType.fromJson(Map<String, dynamic> json) =>
      _$PoiTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PoiTypeToJson(this);
}
