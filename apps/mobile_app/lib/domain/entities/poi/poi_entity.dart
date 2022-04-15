import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:functional_data/functional_data.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/domain/entities/poi/supported_pois.dart';

import '../shared/location.dart';
import '../shared/textual-description.dart';
import 'poi_type.dart';

part 'poi_entity.g.dart';

@FunctionalData()
@JsonSerializable()
class Poi extends $Poi {
  @override
  final String id;
  @override
  @CustomEquality(Ignore())
  final Location location;
  @override
  @CustomEquality(Ignore())
  final double? elevation;
  @override
  @CustomEquality(Ignore())
  final String type;
  @override
  @CustomEquality(Ignore())
  final List<TextualDescription>? description;
  @override
  @CustomEquality(Ignore())
  final List<String>? tags;
  @override
  @CustomEquality(Ignore())
  final String? address;
  @override
  @CustomEquality(Ignore())
  final String? phoneNumber;
  @override
  @CustomEquality(Ignore())
  final String? openingHours;

  Poi(
      {required this.id,
      required this.location,
      this.elevation,
      this.type = "generic:unknown",
      this.description,
      this.openingHours,
      this.phoneNumber,
      this.address,
      this.tags});

  get poiType {
    final splitted = type.split(':');
    var category = splitted.length > 1 ? splitted[0] : 'unknown';
    var kind = splitted.length > 1 ? splitted[1] : splitted[0];
    category =
        supportedTags.keys.toSet().contains(category) ? category : 'generic';
    final isContained = supportedTags[category]?.contains(kind);
    kind = isContained == null || isContained == false ? 'asterisco' : kind;

    final newType = '$category:$kind';

    if (newType != type) {
      debugPrint('Found unsupported POI: $type');
    }

    return PoiType(category: category, kind: kind);
  }

  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);

  Map<String, dynamic> toJson() => _$PoiToJson(this);
}
