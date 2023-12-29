import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_entity.g.dart';

@FunctionalData()
@JsonSerializable()
class ImageEntity extends $ImageEntity {
  @override
  final String? id;
  @override
  final String original;
  @override
  final String card;
  @override
  final String thumbnail;
  @override
  final String? attributions;
  @override
  final List<String>? labels;

  ImageEntity(
      {this.id,
      required this.original,
      required this.card,
      required this.thumbnail,
      this.attributions,
      this.labels});

  factory ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ImageEntityToJson(this);
}
