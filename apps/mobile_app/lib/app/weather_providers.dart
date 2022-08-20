import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/repositories/weather_openweathermap.dart';
import 'package:yaha/domain/repositories/repositories.dart';

final weatherApiProvider =
    Provider<WeatherRepository>((ref) => WeatherRepositoryOpenWeatherMap());
