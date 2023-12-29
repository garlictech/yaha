import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:rxdart/rxdart.dart';
import 'package:turf/turf.dart';

import '../../services/services.dart';
import '../hike/hike_entity.dart';
import '../hike/hiking_settings_entity.dart';
import 'poi_entity.dart';

class PoiOfHikeEntity extends PoiEntity {
  final HikeEntity hike;
  final HikingSettingsEntity settings;
  final Ref ref;
  Stream<LineString>? lineSliceFromStart_;
  Stream<double>? distanceFromStart_;
  Stream<double>? uphillFromStart_;
  Stream<double>? downhillFromStart_;
  Stream<double>? altitude_;
  late final GeocalcService geocalcService;

  PoiOfHikeEntity(
      {required PoiEntity poi,
      required this.hike,
      required this.ref,
      required this.settings})
      : super(
            id: poi.id,
            location: poi.location,
            type: poi.type,
            descriptions: poi.descriptions,
            openingHours: poi.openingHours,
            phone: poi.phone,
            address: poi.address,
            images: poi.images,
            tags: poi.tags) {
    geocalcService = ref.read(geocalcServiceProvider);
  }

  Stream<LineString> get lineSliceFromStart {
    return lineSliceFromStart_ ??= DeferStream(() => Stream.fromFuture(
            geocalcService.snappedLineSlice(
                hike.startPoint, location.location, hike.trail.asLineString)))
        .shareReplay();
  }

  Future<double> get distanceFromStart async {
    return (distanceFromStart_ ??= DeferStream(() => Stream.fromFuture(
            geocalcService.distanceOnLine(hike.startPoint, location.location,
                hike.trail.asLineString))).shareReplay())
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
      return geocalcService.calculateUphillByPositions(slice.coordinates);
    }).shareReplay())
        .last;
  }

  Future<double> get downhillFromStart async {
    return (downhillFromStart_ ??= lineSliceFromStart
            .map(((slice) =>
                geocalcService.calculateDownhillByPositions(slice.coordinates)))
            .shareReplay())
        .last;
  }

  /*Future<num> get altitude async {
    return (elevation as num) ?? (altitude_ ??= DeferStream(() => Stream.fromFuture(
                    geocalc.approximateAltitude(location, hike.route)))
            .shareReplay())
        .last;
  }*/
}
