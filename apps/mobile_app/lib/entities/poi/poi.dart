import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poi.g.dart';

@FunctionalData()
@JsonSerializable()
class Poi extends $Poi {
  @override
  final List<String> imageUrls;

  Poi({
    required this.imageUrls,
  });

  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);

  Map<String, dynamic> toJson() => _$PoiToJson(this);
}
