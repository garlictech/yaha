import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:functional_data/functional_data.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/domain/entities/poi/supported_pois.dart';

import '../image/image.dart';
import '../shared/description.dart';
import '../shared/waypoint.dart';
import 'poi_type.dart';
import '/utils/string.dart';

part 'poi_entity.g.dart';

@FunctionalData()
@JsonSerializable()
class Poi extends $Poi {
  @override
  final String id;
  @override
  @CustomEquality(Ignore())
  final String type;
  @override
  @CustomEquality(Ignore())
  final List<Description>? descriptions;
  @override
  @CustomEquality(Ignore())
  final List<String>? tags;
  @override
  @CustomEquality(Ignore())
  final String? address;
  @override
  @CustomEquality(Ignore())
  final String? phone;
  @override
  @CustomEquality(Ignore())
  final String? openingHours;
  @override
  @CustomEquality(Ignore())
  final String? infoUrl;
  @override
  @CustomEquality(Ignore())
  final List<Image> images;
  @override
  @CustomEquality(Ignore())
  final Waypoint location;

  Poi(
      {required this.id,
      this.type = "generic:unknown",
      this.descriptions,
      this.openingHours,
      this.phone,
      this.images = const [],
      this.address,
      this.infoUrl,
      required this.location,
      this.tags});

  get poiType {
    final convertedType = temporaryTypeConversions(type);
    final splitted = convertedType.split(':');
    var category = splitted.length > 1 ? splitted[0] : 'unknown';
    var kind = splitted.length > 1 ? splitted[1] : splitted[0];
    category =
        supportedTags.keys.toSet().contains(category) ? category : 'generic';
    final isContained = supportedTags[category]?.contains(kind);
    kind = isContained == null || isContained == false ? 'unknown' : kind;

    final newType = '$category:$kind';

    if (newType != convertedType) {
      debugPrint('Found unsupported POI: $type');
    }

    return PoiType(category: category, kind: kind);
  }

  get title {
    return descriptions?.first.title ?? kindAsStr;
  }

  get hasOwnTitle {
    return descriptions?.first.title != null;
  }

  get kindAsStr {
    return poiType.kind.replaceAll('_', ' ');
  }

  get geoPoint {
    return location.location;
  }

  List<String> get imageCardUrls {
    return images.map((image) => image.card).toList();
  }

  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);

  Map<String, dynamic> toJson() => _$PoiToJson(this);
}
