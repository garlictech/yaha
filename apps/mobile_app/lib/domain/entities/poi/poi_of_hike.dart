import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:turf/turf.dart';
import 'package:yaha/utils/geometry/geocalc.dart';

import '../../../app/calculation-providers.dart';
import '../../../utils/geometry/geocalc_js.dart';
import '../hike/hike.dart';
import '../hike/hiking-settings.dart';
import 'poi_entity.dart';

class PoiOfHike extends Poi {
  final Hike hike;
  final HikingSettings settings;
  final Ref ref;
  Stream<LineString>? lineSliceFromStart_;
  Stream<double>? distanceFromStart_;
  Stream<double>? uphillFromStart_;
  Stream<double>? downhillFromStart_;
  Stream<double>? altitude_;
  late final GeocalcService geocalc;

  PoiOfHike(
      {required Poi poi,
      required this.hike,
      required this.ref,
      required this.settings})
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
    geocalc = ref.read(geoCalcProvider);
  }

  Stream<LineString> get lineSliceFromStart {
    return lineSliceFromStart_ ??= DeferStream(() => Stream.fromFuture(
            geocalc.snappedLineSlice(hike.startPoint, location, hike.route)))
        .shareReplay();
  }

  Future<double> get distanceFromStart async {
    return (distanceFromStart_ ??= DeferStream(() => Stream.fromFuture(
                geocalc.distanceOnLine(hike.startPoint, location, hike.route)))
            .shareReplay())
        .last;
  }

  Future<String> get distanceFromStartStr async {
    final dist = await distanceFromStart;
    return dist < 1000 ? "${dist.round()}m" : "${(dist / 100).round() / 10}km";
  }

  Future<int> get durationInMin async {
    return ((await distanceFromStart) / 1000 / settings.speed * 60 +
            (await uphillFromStart) / 10)
        .round();
  }

  Future<String> get durationStr async {
    final duration = await durationInMin;
    return "${(duration / 60).floor()}h ${duration % 60}m";
  }

  Future<String> get arrivalStr async {
    final duration = await durationInMin;
    final arrival = settings.startTime.add(Duration(minutes: duration));
    return "${arrival.hour}:${arrival.minute.toString().padLeft(2, '0')}";
  }

  Future<DateTime> get arrival async {
    return settings.startTime.add(Duration(minutes: await durationInMin));
  }

  Future<double> get uphillFromStart async {
    return (uphillFromStart_ ??= lineSliceFromStart.map((slice) {
      return GeoCalc.calculateUphillByPositions(slice.coordinates);
    }).shareReplay())
        .last;
  }

  Future<double> get downhillFromStart async {
    return (downhillFromStart_ ??= lineSliceFromStart
            .map(((slice) =>
                GeoCalc.calculateDownhillByPositions(slice.coordinates)))
            .shareReplay())
        .last;
  }

  /*Future<num> get altitude async {
    return (elevation as num) ?? (altitude_ ??= DeferStream(() => Stream.fromFuture(
                    geocalc.approximateAltitude(location, hike.route)))
            .shareReplay())
        .last;*/
  }
}
