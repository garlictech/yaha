import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/domain/entities/hike/hike_entity.dart';
import 'cached_hike.dart';

part 'hike_search_results.g.dart';

@riverpod
class HikeSearchResults extends _$HikeSearchResults {
  @override
  Tuple2<List<HikeEntity>, LatLngBounds>? build() {
    final hikeIds =
        ref.watch(hikeSearchStateProvider.select((state) => state.hits));

    final streams = hikeIds
        .map((id) => Stream<HikeEntity?>.fromFuture(
                ref.read(cachedHikeProvider(id).future))
            .startWith(null))
        .toList();

    CombineLatestStream.list<HikeEntity?>(streams)
        .map((hikes) => hikes.whereType<HikeEntity>())
        .map((hikes) {
      if (hikes.isEmpty) {
        return null;
      }

      final firstBoundary = hikes.first.route.coordinates.first.location;
      final lastBoundary = hikes.first.route.coordinates.last.location;
      final corner1 = LatLng(firstBoundary.latitude, firstBoundary.longitude);
      final corner2 = LatLng(lastBoundary.latitude, lastBoundary.longitude);
      final bounds = LatLngBounds(corner1, corner2);

      hikes.map((hike) => hike.route.coordinates).expand((i) => i).forEach(
          (point) => bounds.extend(
              LatLng(point.location.latitude, point.location.longitude)));
      //bounds.pad(0.2);
      state = Tuple2(hikes.toList(), bounds);
    }).toList();

    return null;
  }
}
