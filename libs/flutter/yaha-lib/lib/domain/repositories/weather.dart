import 'package:flutter_yaha_lib/domain/domain.dart';

abstract class WeatherRepository {
  Future<List<WeatherEntity>> getWeatherAround(Location location);
}
