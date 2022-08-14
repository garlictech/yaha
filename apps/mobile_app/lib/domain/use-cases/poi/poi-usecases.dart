import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/services/poi-utility-services.dart';
import 'package:dartz/dartz.dart';
import 'package:yaha/domain/domain.dart';

final poisAroundHikeProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final defaults = ref.read(defaultsProvider);
  final poiUtilities = ref.read(poiUtilityServicesProvider);
  return poiUtilities
      .getPoisOfHike(hikeId, defaults.bigGeoBufferSizeInMeters,
          HikingSettings(speed: defaults.averageSpeedKmh))
      .last;
});

final poisAlongHikeProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final defaults = ref.read(defaultsProvider);
  final poiUtilities = ref.read(poiUtilityServicesProvider);
  return poiUtilities
      .getPoisOfHike(hikeId, defaults.smallGeoBufferSizeInMeters,
          HikingSettings(speed: defaults.averageSpeedKmh))
      .last;
});

final endPointsOfHikeProvider =
    FutureProvider.family<Tuple2<PoiOfHike, PoiOfHike>, String>(
        (ref, hikeId) async {
  final hike = await ref.read(hikeProvider(hikeId).future);
  final defaults = ref.read(defaultsProvider);

  final start = PoiOfHike(
      poi: Poi(
          id: "${hikeId}_STARTPOI",
          location: hike.startPoint,
          elevation: hike.route.coordinates.first[2],
          type: "yaha:start_hike",
          description: [
            TextualDescription(languageKey: "en_US", type: "markdown")
          ]),
      hike: hike,
      settings: HikingSettings(speed: defaults.averageSpeedKmh),
      ref: ref);

  final end = PoiOfHike(
      poi: Poi(
          id: "${hikeId}_ENDPOI",
          location: hike.endPoint,
          type: "yaha:finish_hike",
          elevation: hike.route.coordinates.last[2],
          description: [
            TextualDescription(languageKey: "en_US", type: "markdown")
          ]),
      hike: hike,
      settings: HikingSettings(speed: defaults.averageSpeedKmh),
      ref: ref);

  return Tuple2(start, end);
});

final touristicPoisAlongHikeProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final poisAlongHike = await ref.watch(poisAlongHikeProvider(hikeId).future);
  return PoiUtils.selectTouristicPois<PoiOfHike>(poisAlongHike);
});

final touristicPoisAlongHikeWithYahaPoisProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final poisAlongHike = await ref
      .watch(touristicPoisAlongHikeSortedByDistanceProvider(hikeId).future);
  final endPoints = await ref.watch(endPointsOfHikeProvider(hikeId).future);
  return [
    endPoints.value1,
    ...PoiUtils.selectTouristicPois<PoiOfHike>(poisAlongHike),
    endPoints.value2
  ];
});

final randomTouristicPoisAlongHikeProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final poisAlongHike =
      await ref.watch(touristicPoisAlongHikeProvider(hikeId).future);
  final copiedPois = [...poisAlongHike];
  copiedPois.shuffle();
  return copiedPois.take(10).toList();
});

final touristicPoisAlongHikeSortedByDistanceProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final poisAlongHike =
      await ref.watch(touristicPoisAlongHikeProvider(hikeId).future);
  List<Tuple2<double, PoiOfHike>> forSorting = [];

  for (var poi in poisAlongHike) {
    final val = await poi.distanceFromStart;
    forSorting.add(Tuple2(val, poi));
  }

  forSorting.sort((a, b) {
    return a.value1.compareTo(b.value1);
  });

  return forSorting.map((t) => t.value2).toList();
});
