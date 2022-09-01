import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/providers.dart';
import 'package:yaha/domain/domain.dart';

final weatherPoisOfHikeProvider =
    FutureProvider.family<List<PoiOfHike>, String>((ref, hikeId) async {
  final hike = await ref.read(hikeProvider(hikeId).future);
  final defaults = ref.read(defaultsProvider);
  final weatherApi = ref.read(weatherApiProvider);
  final weather = await weatherApi.getWeatherAround(hike.startPoint);
  final geocalc = ref.read(geoCalcProvider);
  final settings = HikingSettings(speed: defaults.averageSpeedKmh);

  List<PoiOfHike> weatherPois = [];

  getLocationOfEvent() async {
    for (final loc in hike.route.coordinates) {
      final distFromStart = await geocalc.distanceOnLine(
          hike.startPoint,
          Location(lat: loc.latitude, lon: loc.longitude),
          hike.route.asLineString);

      final duration = (distFromStart / 1000 / settings.speed * 60).round();
      final arrival = settings.startTime.add(Duration(minutes: duration));
    }
  }

  return weather.map((weatherItem) {
    return PoiOfHike(
        poi: Poi(
            id: "${hikeId}_WEATHER",
            location: Location(
                lat: hike.route.coordinates[20].latitude,
                lon: hike.route.coordinates[20].longitude),
            type: "weather:${weatherItem.type}",
            elevation: hike.route.coordinates[20].height,
            description: [Description(languageKey: "en_US", type: "markdown")]),
        hike: hike,
        settings: HikingSettings(speed: defaults.averageSpeedKmh),
        ref: ref);
  }).toList();
});
