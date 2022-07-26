import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'imageinfo.g.dart';

@FunctionalData()
@JsonSerializable()
class Imageinfo extends $Imageinfo {
  @override
  final String url;
  @override
  final int? width;
  @override
  final int? height;

  Imageinfo({required this.url, this.width, this.height});

  factory Imageinfo.fromJson(Map<String, dynamic> json) =>
      _$ImageinfoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageinfoToJson(this);
}
