import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/domain/entities/hike/hike_entity.dart';
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

      final bounds = LatLngBounds();
      hikes.map((hike) => hike.route.coordinates).expand((i) => i).forEach(
          (point) => bounds.extend(
              LatLng(point.location.latitude, point.location.longitude)));
      bounds.pad(0.2);
      state = Tuple2(hikes.toList(), bounds);
    }).toList();

    return null;
  }
}
