import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';

import '../../services/services.dart';
import '../hike/create_configured_hike.dart';

part "end_points_of_hike.g.dart";

@riverpod
class EndPointsOfHike extends _$EndPointsOfHike {
  @override
  FutureOr<Tuple2<PoiOfHikeEntity, PoiOfHikeEntity>> build(String hikeId) {
    final hikeSettings = ref.watch(hikingSettingsServiceProvider(hikeId));

    return ref.watch(createConfiguredHikeProvider(hikeId).future).then((hike) {
      final start = PoiOfHikeEntity(
          poi: PoiEntity(
              id: "${hikeId}_STARTPOI",
              location: Waypoint(location: hike.startPoint),
              type: "yaha:start_hike",
              descriptions: [
                Description(languageKey: "en_US", type: "markdown")
              ]),
          hike: hike,
          settings: hikeSettings,
          ref: ref);

      final end = PoiOfHikeEntity(
          poi: PoiEntity(
              id: "${hikeId}_ENDPOI",
              location: Waypoint(location: hike.endPoint),
              type: "yaha:finish_hike",
              descriptions: [
                Description(languageKey: "en_US", type: "markdown")
              ]),
          hike: hike,
          settings: hikeSettings,
          ref: ref);

      return Tuple2(start, end);
    });
  }
}
