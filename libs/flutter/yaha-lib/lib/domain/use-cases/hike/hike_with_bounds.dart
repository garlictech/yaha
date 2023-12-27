import 'package:dartz/dartz.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

import '../../calculations/get_hike_bounds.dart';

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
    final bounds = getHikeBounds(hike);
    return Tuple2(hike, bounds);
  }
}
