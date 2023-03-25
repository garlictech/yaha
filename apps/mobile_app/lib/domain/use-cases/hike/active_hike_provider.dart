import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/entities/shared/active_point.dart';
import 'package:yaha/domain/use-cases/hike/hike.dart';

import '../../../utils/geometry/geocalc.dart';
import '../../entities/entities.dart';
import '../../entities/hike/active_hike.dart';

sumSegments(List<num> segmentVals) {
  final List<num> valsFromStart = [segmentVals[0]];

  final range = List<int>.generate(segmentVals.length - 1, (i) => i);

  for (var i in range) {
    valsFromStart.add(valsFromStart[i] + segmentVals[i + 1]);
  }

  return valsFromStart;
}

final activeHikeProvider =
    FutureProvider.family<ActiveHike?, String>((ref, hikeId) async {
  final hike = await ref.read(cachedHikeProvider(hikeId).future);

  if (hike == null) {
    return null;
  }

  final settings = ref.watch(hikingSettingsProvider);

  final List<Point> coordinates =
      hike.route.coordinates.map((coords) => coords.location).toList();

  final range = Iterable<int>.generate(coordinates.length - 1);

  final Iterable<Tuple2<Point, Point>> pairs =
      range.map((i) => Tuple2(coordinates[i], coordinates[i + 1]));

  final List<num> segmentDistances = pairs
      .map((pair) => GeoCalc.geoDistance(pair.value1.latitude,
          pair.value1.longitude, pair.value2.latitude, pair.value2.longitude))
      .toList();

  final List<num> distancesFromStart = sumSegments(segmentDistances);

  final List<num> segmentUphills = pairs
      .map((pair) => max(0, pair.value2.height - pair.value1.height))
      .toList();

  final List<num> uphillsFromStart = sumSegments(segmentUphills);

  final List<num> durationInSeconds =
      Iterable<int>.generate(distancesFromStart.length)
          .map((i) =>
              distancesFromStart[i] / 1000 / settings.speed * 3600 +
              uphillsFromStart[i] / 6)
          .toList(); // /10 * 60, uphill delay in seconds

  final List<DateTime> arrivals = durationInSeconds
      .map((duration) =>
          settings.startTime.add(Duration(seconds: duration.floor())))
      .toList();

  final List<ActivePoint> activePoints = range
      .map((i) => ActivePoint(point: coordinates[i + 1], arrival: arrivals[i]))
      .toList();

  activePoints.insert(
      0, ActivePoint(point: coordinates[0], arrival: settings.startTime));

  return ActiveHike(activePoints: activePoints);
});
