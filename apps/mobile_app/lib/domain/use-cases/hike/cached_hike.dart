import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/entities/shared/route.dart';
import 'package:yaha/domain/states/image/bad_images.dart';

import '../../entities/hike/hike.dart';
import '../../utils/utils.dart';
import 'hiking_settings_service.dart';

part 'cached_hike.g.dart';

typedef CachedHikeState = LoadableState<Hike>;

@riverpod
class CachedHike extends _$CachedHike {
  @override
  CachedHikeState build(String hikeId) {
    final badImages = ref.watch(badImagesProvider);
    final geoCalc = ref.read(geoCalcProvider);
    final settings = ref.watch(hikingSettingsServiceProvider(hikeId));

    ref.read(hikeRepositoryProvider).getHike(hikeId).then((hikeEntity) {
      final route = Route(
          route: settings.reversedHike
              ? hikeEntity.route.reversed()
              : hikeEntity.route);

      return geoCalc
          .getFixedDistanceCoordinates(route.asLineString, 1)
          .then((distanceMarkers) {
        return Hike(
            hike: hikeEntity.copyWith(route: route),
            distanceMarkers: distanceMarkers);
      });
    }).then((hike) {
      final newImages = hike.route.images.where((image) =>
          {image.card, image.original, image.thumbnail}
              .difference(badImages)
              .length ==
          3);

      if (newImages.length != hike.route.images.length) {
        final newRoute = hike.route.copyWith(images: newImages.toList());
        final newHike = Hike(
            hike: hike.hike.copyWith(route: newRoute),
            distanceMarkers: hike.distanceMarkers);

        state = CachedHikeState(loading: false, error: null, data: newHike);
      } else {
        state = CachedHikeState(loading: false, error: null, data: hike);
      }
    });

    return CachedHikeState(loading: true);
  }
}
