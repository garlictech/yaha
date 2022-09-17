import 'package:dio/dio.dart';
import 'package:yaha/domain/domain.dart';

class WeatherRepositoryOpenWeatherMap implements WeatherRepository {
  static const apiUrl = 'https://api.openweathermap.org/data/2.5';

  @override
  getWeatherAround(Location location) async {
    return Dio().get(
      '$apiUrl/forecast',
      queryParameters: {
        'lat': location.lat,
        'lon': location.lon,
        'APIKEY': 'e5a0aba93cfca3ee54c272133018df78',
        'units': 'metric',
      },
    ).then((result) {
      final sunrise = DateTime.fromMillisecondsSinceEpoch(
          result.data['city']['sunrise'] * 1000);

      final sunset = DateTime.fromMillisecondsSinceEpoch(
          result.data['city']['sunset'] * 1000);

      return [
        Weather(when: sunset, type: "sunset"),
        Weather(when: sunrise, type: "sunrise")
      ];
    });
  }
}
