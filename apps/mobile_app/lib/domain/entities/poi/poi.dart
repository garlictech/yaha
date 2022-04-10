import 'dart:core';

import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../shared/location.dart';
import '../shared/textual-description.dart';

part 'poi.g.dart';

@FunctionalData()
@JsonSerializable()
class Poi extends $Poi {
  @override
  final String id;
  @override
  final Location location;
  @override
  final double? elevation;
  @override
  final List<String>? types;
  @override
  final TextualDescription? description;
  @override
  final List<String>? tags;
  @override
  final String? address;
  @override
  final String? phoneNumber;
  @override
  final String? openingHours;

  Poi(
      {required this.id,
      required this.location,
      this.elevation,
      this.types,
      this.description,
      this.openingHours,
      this.phoneNumber,
      this.address,
      this.tags});

  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);

  Map<String, dynamic> toJson() => _$PoiToJson(this);
}
