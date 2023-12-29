import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/services.dart';
import 'fetch_track_entity.dart';

part 'create_configured_hike.g.dart';

@riverpod
class CreateConfiguredHike extends _$CreateConfiguredHike {
  @override
  FutureOr<HikeEntity> build(String hikeId) async {
    final badImages = ref.watch(badImagesServiceProvider);
    final geoCalc = ref.read(geocalcServiceProvider);
    final isReversedHike = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.reversedHike));

    final track = await ref.watch(fetchTrackEntityProvider(hikeId).future);

    final route = isReversedHike ? track.route.reversed() : track.route;

    final trail = TrailEntity(route: route);

    final distanceMarkers =
        await geoCalc.getFixedDistanceCoordinates(trail.asLineString, 1);

    final newTrack = track.copyWith(route: route);

    final hike =
        HikeEntity(track: newTrack, distanceMarkers: distanceMarkers, ref: ref);

    final newImages = hike.trail.images.where((image) =>
        {image.card, image.original, image.thumbnail}
            .difference(badImages)
            .length ==
        3);

    final newTrail = newImages.length != hike.trail.images.length
        ? trail.copyWith(images: newImages.toList())
        : trail;

    return HikeEntity(
        track: hike.track.copyWith(route: newTrail),
        distanceMarkers: hike.distanceMarkers,
        ref: ref);
  }
}
