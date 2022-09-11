import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/domain.dart';

import '../hike/hike_provider.dart';

final weatherPoisOfHikeProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final hike = await ref.watch(hikeProvider(hikeId).future);

  final defaults = ref.read(defaultsProvider);
  final weatherApi = ref.read(weatherApiProvider);
  final weather = await weatherApi.getWeatherAround(
      Location(lat: hike.startPoint.latitude, lon: hike.startPoint.longitude));
  final geocalc = ref.read(geoCalcProvider);
  final settings = HikingSettings(speed: defaults.averageSpeedKmh);

  List<PoiOfHike> weatherPois = [];

  getLocationOfEvent() async {
    for (final loc in hike.route.coordinates) {
      final distFromStart = await geocalc.distanceOnLine(
          hike.startPoint, loc.location, hike.route.asLineString);

      final duration = (distFromStart / 1000 / settings.speed * 60).round();
      final arrival = settings.startTime.add(Duration(minutes: duration));
    }
  }

  return weather.map((weatherItem) {
    return PoiOfHike(
        poi: Poi(
            id: "${hikeId}_WEATHER",
            location: hike.route.coordinates[20],
            type: "weather:${weatherItem.type}",
            descriptions: [
              Description(languageKey: "en_US", type: "markdown")
            ]),
        hike: hike,
        settings: HikingSettings(speed: defaults.averageSpeedKmh),
        ref: ref);
  }).toList();
});
