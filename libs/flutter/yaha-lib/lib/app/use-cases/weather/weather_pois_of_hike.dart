import 'package:flutter_yaha_lib/app/app.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_pois_of_hike.g.dart';

@riverpod
class WeatherPoisOfHike extends _$WeatherPoisOfHike {
  @override
  Future<List<PoiOfHikeEntity>> build(String hikeId) async {
    final hike = await ref.watch(createConfiguredHikeProvider(hikeId).future);
    final itinerary =
        await ref.watch(createHikeItineraryProvider(hikeId).future);
    final weatherApi = ref.read(weatherApiProvider);
    final settings = ref.watch(hikingSettingsServiceProvider(hikeId));

    final weather = await weatherApi.getWeatherAround(Location(
        lat: hike.startPoint.latitude, lon: hike.startPoint.longitude));

    getLocationOfEvent(WeatherEntity weatherItem) {
      return itinerary.activePoints
          .firstWhere((point) => weatherItem.when.isBefore(point.arrival));
    }

    return weather
        .where((weatherItem) =>
            weatherItem.when.isAfter(itinerary.activePoints.first.arrival) &&
            weatherItem.when.isBefore(itinerary.activePoints.last.arrival))
        .map((weatherItem) {
      return PoiOfHikeEntity(
          poi: PoiEntity(
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
  }
}
