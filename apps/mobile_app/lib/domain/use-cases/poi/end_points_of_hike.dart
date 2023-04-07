import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/domain/domain.dart';

part "end_points_of_hike.g.dart";

@riverpod
class EndPointsOfHike extends _$EndPointsOfHike {
  @override
  Future<Tuple2<PoiOfHike, PoiOfHike>?> build(String hikeId) async {
    final hike = await ref.watch(cachedHikeProvider(hikeId).future);
    final hikeSettings = ref.watch(hikingSettingsServiceProvider(hikeId));

    final start = PoiOfHike(
        poi: Poi(
            id: "${hikeId}_STARTPOI",
            location: Waypoint(location: hike.startPoint),
            type: "yaha:start_hike",
            descriptions: [
              Description(languageKey: "en_US", type: "markdown")
            ]),
        hike: hike,
        settings: hikeSettings,
        ref: ref);

    final end = PoiOfHike(
        poi: Poi(
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
  }
}
