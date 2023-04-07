import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/entities/shared/route.dart';
import 'package:yaha/domain/states/image/bad_images.dart';

import '../../entities/hike/hike.dart';
import 'hiking_settings_service.dart';

part 'cached_hike.g.dart';

@riverpod
class CachedHike extends _$CachedHike {
  @override
  Future<Hike> build(String hikeId) async {
    final badImages = ref.watch(badImagesProvider);
    final geoCalc = ref.read(geoCalcProvider);
    final settings = ref.watch(hikingSettingsServiceProvider(hikeId));

    Hike hike =
        await ref.read(hikeRepositoryProvider).getHike(hikeId).then((h) async {
      final route =
          Route(route: settings.reversedHike ? h.route.reversed() : h.route);
      final distanceMarkers =
          await geoCalc.getFixedDistanceCoordinates(route.asLineString, 1);
      return Hike(
          hike: h.copyWith(route: route), distanceMarkers: distanceMarkers);
    });

    final newImages = hike.route.images.where((image) =>
        {image.card, image.original, image.thumbnail}
            .difference(badImages)
            .length ==
        3);

    if (newImages.length != hike.route.images.length) {
      final newRoute = hike.route.copyWith(images: newImages.toList());
      hike = Hike(
          hike: hike.hike.copyWith(route: newRoute),
          distanceMarkers: hike.distanceMarkers);
    }

    state = AsyncData(hike);
    return hike;
  }
}
