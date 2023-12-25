import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/app/providers.dart';
import 'package:flutter_yaha_lib/domain/entities/shared/route.dart';
import 'package:flutter_yaha_lib/domain/states/image/bad_images.dart';
import 'package:flutter_yaha_lib/domain/use-cases/hike/cached_hike.dart';

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
    final reversedHike = ref.watch(hikingSettingsServiceProvider(hikeId)
        .select((value) => value.reversedHike));

    ref.watch(cachedHikeProvider(hikeId).future).then((hikeEntity) {
      final route = Route(
          route: reversedHike ? hikeEntity.route.reversed() : hikeEntity.route);

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
