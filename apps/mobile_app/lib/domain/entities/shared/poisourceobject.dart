import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poisourceobject.g.dart';

@FunctionalData()
@JsonSerializable()
class PoiSourceObject extends $PoiSourceObject {
  @override
  final String objectType;
  @override
  final String? languageKey;
  @override
  final String objectId;
  @override
  final String? url;

  PoiSourceObject(
      {required this.objectType,
      this.languageKey,
      required this.objectId,
      this.url});

  factory PoiSourceObject.fromJson(Map<String, dynamic> json) =>
      _$PoiSourceObjectFromJson(json);

  Map<String, dynamic> toJson() => _$PoiSourceObjectToJson(this);
}
