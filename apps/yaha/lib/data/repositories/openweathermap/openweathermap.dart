import 'package:yaha/domain/domain.dart';

import 'One_Call/one_call_weather_factory.dart';
import 'One_Call/one_call_weather_model.dart';
import 'Utilities/general_enums.dart';
import 'Utilities/location_coords.dart';
import 'Utilities/request_response.dart';
import 'Utilities/units_settings.dart';

class WeatherRepositoryOpenWeatherMap implements WeatherRepository {
  static const apiUrl = 'https://api.openweathermap.org/data/2.5';

  @override
  getWeatherAround(Location location) async {
    OneCallWeatherFactory factory = OneCallWeatherFactory(
                apiKey:  'e5a0aba93cfca3ee54c272133018df78',
                settings: UnitSettings(
                ),
                locationCoords: LocationCoords(
                  longitude: location.lon,
                  latitude: location.lat,
                ),
                maxTimeBeforeTimeout: const Duration(seconds: 10),
              );

              // Requesting the weather
              RequestResponse<OneCallWeather?> result =
                  await factory.getWeather();

              // Checking if the request was successful
              if (result.requestStatus == RequestStatus.Successful) {
                // Printing the current weather type
                print(result.response!.currentWeather!.weatherType);
                // Printing the next hour's weather type
                print(result.response!.hourlyWeather![1]!.weatherType);
                // Printing the precipitation amount 30 minutes later
                print(
                    result.response!.minutelyWeather![29]!.precipitationAmount);
                return [];
              } else {
                // Printing the error that occurred
                print("Error of type ${result.requestStatus} occurred");
                return [];
              }

    /*return Dio().get(
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

      final weatherConditions = result.data['list'].map((item) {
        return Weather(
            when: DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
            type: item['weather'][0]['main'].toLowerCase());
      }).toList();

      return [
        Weather(when: sunset, type: "sunset"),
        Weather(when: sunrise, type: "sunrise"),
        ...weatherConditions
      ];
    });*/
  }
}
