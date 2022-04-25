import 'dart:core';
import 'package:rxdart/rxdart.dart';
import 'package:yaha/utils/geometry/geocalc_js.dart';

import '../hike/hike.dart';
import 'poi_entity.dart';

class PoiOfHike extends Poi {
  final Hike hike;
  final GeocalcService geocalcService;
  late Stream<double> distanceFromStart;
  late double? distanceFromStartSync;

  PoiOfHike(
      {required Poi poi, required this.hike, required this.geocalcService})
      : super(
            id: poi.id,
            location: poi.location,
            elevation: poi.elevation,
            type: poi.type,
            description: poi.description,
            openingHours: poi.openingHours,
            phoneNumber: poi.phoneNumber,
            address: poi.address,
            tags: poi.tags) {
    distanceFromStart = DeferStream(() => Stream.fromFuture(geocalcService
            .distanceOnLine(hike.startPoint, poi.location, hike.route)))
        .doOnData((dist) => distanceFromStartSync = dist)
        .shareReplay();
  }
}
