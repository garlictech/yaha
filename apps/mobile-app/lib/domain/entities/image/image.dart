import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/domain/entities/shared/poisourceobject.dart';

import './imagelabel.dart';
import './imageinfo.dart';
import '../shared/location.dart';
import '../shared/poisourceobject.dart';

part 'image.g.dart';

@FunctionalData()
@JsonSerializable()
class Image extends $Image {
  @override
  final String id;
  @override
  final Location location;
  @override
  final Imageinfo original;
  @override
  final Imageinfo card;
  @override
  final Imageinfo thumbnail;
  @override
  final PoiSourceObject? sourceObject;
  @override
  final String? attributions;
  @override
  final List<Imagelabel>? labels;
  @override
  final bool? banned;

  Image(
      {required this.id,
      required this.location,
      required this.original,
      required this.card,
      required this.thumbnail,
      this.sourceObject,
      this.attributions,
      this.labels,
      this.banned});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
