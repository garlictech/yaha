export 'poi-type.dart';
import 'dart:core';

import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../shared/location.dart';
import '../shared/textual-description.dart';
import 'poi-type.dart';

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
  final List<TextualDescription>? description;
  @override
  final List<String>? tags;
  @override
  final String? address;
  @override
  final String? phoneNumber;
  @override
  final String? openingHours;

  Set<PoiType>? _poiTypes;

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

  get poiTypes {
    return _poiTypes ??= types?.map((type) {
      final splitted = type.split(':');
      return splitted.length > 1
          ? PoiType(category: splitted[0], kind: splitted[1])
          : PoiType(category: 'unknown', kind: splitted[0]);
    }).toSet();
  }

  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);

  Map<String, dynamic> toJson() => _$PoiToJson(this);
}
