export 'poi-type.dart';
import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../shared/location.dart';
import '../shared/textual-description.dart';
import 'poi-type.dart';

part 'poi.g.dart';

@JsonSerializable()
class Poi extends Equatable {
  final String id;
  final Location location;
  final double? elevation;
  final String type;
  final List<TextualDescription>? description;
  final List<String>? tags;
  final String? address;
  final String? phoneNumber;
  final String? openingHours;

  @JsonKey(ignore: true)
  PoiType? poiType_;

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
    getPoiType() {
      final splitted = type.split(':');
      return splitted.length > 1
          ? PoiType(category: splitted[0], kind: splitted[1])
          : PoiType(category: 'unknown', kind: splitted[0]);
    }

    return poiType_ ??= getPoiType();
  }

  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);

  Map<String, dynamic> toJson() => _$PoiToJson(this);

  @override
  List<Object> get props => [id];
}
