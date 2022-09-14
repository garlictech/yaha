import 'dart:core';
import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:yaha/domain/entities/poi/supported_pois.dart';

import '../image/image.dart';
import '../shared/description.dart';
import '../shared/waypoint.dart';
import 'poi_type.dart';
import '/utils/string.dart';

part 'poi_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class Poi {
  final String id;
  final String type;
  final List<Description>? descriptions;
  final List<String>? tags;
  final String? address;
  final String? phone;
  final String? openingHours;
  final String? infoUrl;
  final List<Image> images;
  final Waypoint location;

  @JsonKey(ignore: true)
  PoiType? _poiType;

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
    getPoitype() {
      final convertedType = temporaryTypeConversions(type);
      final splitted = convertedType.split(':');
      var category = splitted.length > 1 ? splitted[0] : null;
      var kind = splitted.length > 1 ? splitted[1] : splitted[0];

      category ??= supportedTags.keys.toSet().firstWhere(
          (key) => supportedTags[key]!.contains(kind),
          orElse: () => '');

      category =
          supportedTags.keys.toSet().contains(category) ? category : 'generic';

      final isContained = supportedTags[category]?.contains(kind);
      kind = isContained == null || isContained == false ? 'unknown' : kind;

      if (kind == 'unknown') {
        debugPrint('Found unsupported POI: $type');
      }

      return PoiType(category: category, kind: kind);
    }

    return _poiType ??= getPoitype();
  }

  get title {
    return (descriptions?.isNotEmpty ?? false)
        ? descriptions!.first.title ?? kindAsStr
        : kindAsStr;
  }

  get summary {
    return (descriptions?.isNotEmpty ?? false) ? descriptions!.first : null;
  }

  get hasOwnTitle {
    return (descriptions?.isNotEmpty ?? false)
        ? descriptions!.first.title != null
        : false;
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
