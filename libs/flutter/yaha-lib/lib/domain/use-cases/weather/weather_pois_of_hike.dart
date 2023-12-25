import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/app/providers.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/domain/use-cases/hike/active_hike.dart';

part 'weather_pois_of_hike.g.dart';

@riverpod
class WeatherPoisOfHike extends _$WeatherPoisOfHike {
  @override
  List<PoiOfHike> build(String hikeId) {
    final hikeState = ref.watch(configuredHikeProvider(hikeId));
    final activeHike = ref.watch(activeHikeProvider(hikeId));
    final weatherApi = ref.read(weatherApiProvider);
    final settings = ref.watch(hikingSettingsServiceProvider(hikeId));

    if (hikeState.data == null || activeHike == null) {
      state = [];
      return [];
    }

    final hike = hikeState.data!;

    weatherApi
        .getWeatherAround(Location(
            lat: hike.startPoint.latitude, lon: hike.startPoint.longitude))
        .then((weather) {
      getLocationOfEvent(Weather weatherItem) {
        return activeHike.activePoints
            .firstWhere((point) => weatherItem.when.isBefore(point.arrival));
      }

      state = weather
          .where((weatherItem) =>
              weatherItem.when.isAfter(activeHike.activePoints.first.arrival) &&
              weatherItem.when.isBefore(activeHike.activePoints.last.arrival))
          .map((weatherItem) {
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

    return [];
  }
}
