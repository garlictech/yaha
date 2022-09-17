import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/domain/use-cases/hike/active_hike_provider.dart';

final weatherPoisOfHikeProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final hike = await ref.watch(hikeProvider(hikeId).future);
  final activeHike = await ref.watch(activeHikeProvider(hikeId).future);
  final weatherApi = ref.read(weatherApiProvider);
  final weather = await weatherApi.getWeatherAround(
      Location(lat: hike.startPoint.latitude, lon: hike.startPoint.longitude));
  final settings = ref.watch(hikingSettingsProvider(hikeId));

  getLocationOfEvent(Weather weatherItem) {
    return activeHike.activePoints
        .firstWhere((point) => weatherItem.when.isBefore(point.arrival));
  }

  return weather
      .where((weatherItem) =>
          weatherItem.when.isAfter(activeHike.activePoints.first.arrival) &&
          weatherItem.when.isBefore(activeHike.activePoints.last.arrival))
      .map((weatherItem) {
    debugPrint(
        "WEATHER LOC ${Waypoint(location: getLocationOfEvent(weatherItem))}");
    debugPrint("WEATHER  ${weatherItem}");
    return PoiOfHike(
        poi: Poi(
            id: "${hikeId}_WEATHER",
            location: Waypoint(location: getLocationOfEvent(weatherItem)),
            type: "weather:${weatherItem.type}",
            descriptions: [
              Description(languageKey: "en_US", type: "markdown")
            ]),
        hike: hike,
        settings: settings,
        ref: ref);
  }).toList();
});
