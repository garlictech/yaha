import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@FunctionalData()
@JsonSerializable()
class Image extends $Image {
  @override
  final String id;
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

  Image(
      {required this.id,
      required this.original,
      required this.card,
      required this.thumbnail,
      this.attributions,
      this.labels});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
