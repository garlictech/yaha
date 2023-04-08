import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/entities/shared/route.dart';
import 'package:yaha/domain/states/image/bad_images.dart';
import 'package:yaha/domain/use-cases/hike/cached_hike.dart';

import '../../entities/hike/hike.dart';
import '../../utils/utils.dart';
import 'hiking_settings_service.dart';

part 'configured_hike.g.dart';

typedef ConfiguredHikeState = LoadableState<Hike>;

@riverpod
class ConfiguredHike extends _$ConfiguredHike {
  @override
  ConfiguredHikeState build(String hikeId) {
    final badImages = ref.watch(badImagesProvider);
    final geoCalc = ref.read(geoCalcProvider);
    final settings = ref.watch(hikingSettingsServiceProvider(hikeId));

    ref.watch(cachedHikeProvider(hikeId).future).then((hikeEntity) {
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

        state = ConfiguredHikeState(loading: false, error: null, data: newHike);
      } else {
        state = ConfiguredHikeState(loading: false, error: null, data: hike);
      }
    });

    return ConfiguredHikeState(loading: true);
  }
}
