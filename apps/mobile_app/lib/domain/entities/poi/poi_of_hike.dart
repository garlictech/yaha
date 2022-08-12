import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../../app/calculation-providers.dart';
import '../hike/hike.dart';
import 'poi_entity.dart';

class PoiOfHike extends Poi {
  final Hike hike;
  final Ref ref;

  PoiOfHike({required Poi poi, required this.hike, required this.ref})
      : super(
            id: poi.id,
            location: poi.location,
            elevation: poi.elevation,
            type: poi.type,
            description: poi.description,
            openingHours: poi.openingHours,
            phoneNumber: poi.phoneNumber,
            address: poi.address,
            tags: poi.tags);

  Future<double> get distanceFromStart async {
    final geocalc = ref.read(geoCalcProvider);
    return DeferStream(() => Stream.fromFuture(
            geocalc.distanceOnLine(hike.startPoint, location, hike.route)))
        .shareReplay()
        .last;
  }
}
