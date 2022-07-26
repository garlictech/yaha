import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'imagelabel.g.dart';

@FunctionalData()
@JsonSerializable()
class Imagelabel extends $Imagelabel {
  @override
  final String label;
  @override
  final double confidence;

  Imagelabel({required this.label, required this.confidence});

  factory Imagelabel.fromJson(Map<String, dynamic> json) =>
      _$ImagelabelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagelabelToJson(this);
}
