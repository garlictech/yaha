import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/data/repositories/weather_openweathermap.dart';
import 'package:flutter_yaha_lib/domain/repositories/repositories.dart';

final weatherApiProvider =
    Provider<WeatherRepository>((ref) => WeatherRepositoryOpenWeatherMap());
