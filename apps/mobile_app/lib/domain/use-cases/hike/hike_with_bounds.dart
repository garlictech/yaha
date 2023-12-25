import 'package:dartz/dartz.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/domain.dart';

part "hike_with_bounds.g.dart";

@riverpod
class HikeWithBounds extends _$HikeWithBounds {
  @override
  Tuple2<Hike, LatLngBounds>? build(String hikeId) {
    final hikeState = ref.watch(configuredHikeProvider(hikeId));

    if (hikeState.data == null) {
      return null;
    }

    final hike = hikeState.data!;

    final firstBoundary = hike.route.coordinates.first.location;
    final lastBoundary = hike.route.coordinates.last.location;
    final corner1 = LatLng(firstBoundary.latitude, firstBoundary.longitude);
    final corner2 = LatLng(lastBoundary.latitude, lastBoundary.longitude);
    final bounds = LatLngBounds(corner1, corner2);

    for (var point in hike.route.coordinates) {
      bounds.extend(LatLng(point.location.latitude, point.location.longitude));
    }
    //bounds.pad(0.2);

    return Tuple2(hike, bounds);
  }
}
