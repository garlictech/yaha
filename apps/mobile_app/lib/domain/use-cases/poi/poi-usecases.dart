import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/services/poi-utility-services.dart';
import 'package:dartz/dartz.dart';
import 'package:yaha/domain/domain.dart';

final poisAroundHikeProvider =
    FutureProvider.family<List<Poi>, String>((ref, hikeId) async {
  final poiUtilities = ref.read(poiUtilityServicesProvider);
  final hike = await ref.read(cachedHikeProvider(hikeId).future);
  final hikeSettings = ref.watch(hikingSettingsProvider);

  return hike == null
      ? Future.value([])
      : poiUtilities.getOffroutePoisOfHike(hike, hikeSettings);
});

final poisAlongHikeProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final poiUtilities = ref.read(poiUtilityServicesProvider);
  final hike = await ref.read(cachedHikeProvider(hikeId).future);
  final hikeSettings = ref.watch(hikingSettingsProvider);

  return hike == null
      ? Future.value([])
      : poiUtilities.getOnroutePoisOfHike(hike, hikeSettings);
});

final endPointsOfHikeProvider =
    FutureProvider.family<Tuple2<PoiOfHike, PoiOfHike>?, String>(
        (ref, hikeId) async {
  final hike = await ref.read(cachedHikeProvider(hikeId).future);

  if (hike == null) {
    return null;
  }

  final defaults = ref.read(defaultsProvider);
  final hikeSettings = ref.watch(hikingSettingsProvider);

  final start = PoiOfHike(
      poi: Poi(
          id: "${hikeId}_STARTPOI",
          location: Waypoint(location: hike.startPoint),
          type: "yaha:start_hike",
          descriptions: [Description(languageKey: "en_US", type: "markdown")]),
      hike: hike,
      settings: hikeSettings,
      ref: ref);

  final end = PoiOfHike(
      poi: Poi(
          id: "${hikeId}_ENDPOI",
          location: Waypoint(location: hike.endPoint),
          type: "yaha:finish_hike",
          descriptions: [Description(languageKey: "en_US", type: "markdown")]),
      hike: hike,
      settings: hikeSettings,
      ref: ref);
  return Tuple2(start, end);
});

final touristicPoisAlongHikeProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final poisAlongHike = await ref.watch(poisAlongHikeProvider(hikeId).future);
  return PoiUtils.selectTouristicPois<PoiOfHike>(poisAlongHike);
});

final importantPoisAlongHikeWithYahaPoisProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final poisAlongHike = await ref
      .watch(touristicPoisAlongHikeSortedByDistanceProvider(hikeId).future);
  final endPoints = await ref.watch(endPointsOfHikeProvider(hikeId).future);

  if (endPoints == null) {
    return [];
  }

  final weatherPois = await ref.watch(weatherPoisOfHikeProvider(hikeId).future);
  final sortedPois = await PoiUtils.sortByDistanceFromHikeStart(
      PoiUtils.selectTouristicPois<PoiOfHike>(poisAlongHike) + weatherPois);

  return [endPoints.value1, ...sortedPois, endPoints.value2];
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
  return PoiUtils.sortByDistanceFromHikeStart(poisAlongHike);
});
