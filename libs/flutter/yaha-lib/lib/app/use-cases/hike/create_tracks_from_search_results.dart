import 'package:dartz/dartz.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

import 'fetch_track_entity.dart';

part 'create_tracks_from_search_results.g.dart';

@riverpod
class CreateTracksFromSearchResultsUsecase
    extends _$CreateTracksFromSearchResultsUsecase {
  @override
  FutureOr<void> build() {}

  execute(List<String> foundTrackIds) {
    final streams = foundTrackIds
        .map((id) => Stream<TrackEntity?>.fromFuture(
                ref.read(fetchTrackEntityProvider(id).future))
            .startWith(null))
        .toList();

    return CombineLatestStream.list<TrackEntity?>(streams)
        .map((hikes) => hikes.whereType<TrackEntity>())
        .map((hikes) {
      if (hikes.isEmpty) {
        return null;
      }

      final firstBoundary = hikes.first.route.coordinates.first.location;
      final lastBoundary = hikes.first.route.coordinates.last.location;
      final corner1 = LatLng(firstBoundary.latitude, firstBoundary.longitude);
      final corner2 = LatLng(lastBoundary.latitude, lastBoundary.longitude);
      final bounds = LatLngBounds(corner1, corner2);

      hikes.map((track) => track.route.coordinates).expand((i) => i).forEach(
          (point) => bounds.extend(
              LatLng(point.location.latitude, point.location.longitude)));
      return Tuple2(hikes.toList(), bounds);
    }).toList();
  }
}
