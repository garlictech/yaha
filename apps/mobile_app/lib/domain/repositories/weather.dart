import '../entities/entities.dart';

abstract class WeatherRepository {
  Future<List<Weather>> getWeatherAround(Location location);
}
