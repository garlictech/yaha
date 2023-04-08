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
    final hikeState = ref.watch(cachedHikeProvider(hikeId));

    if (hikeState.data == null) {
      return null;
    }

    final hike = hikeState.data!;

    final bounds = LatLngBounds();
    hike.route.coordinates.forEach((point) => bounds
        .extend(LatLng(point.location.latitude, point.location.longitude)));
    bounds.pad(0.2);

    return Tuple2(hike, bounds);
  }
}
