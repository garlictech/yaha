import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/data/repositories/repositories.dart';
import 'package:yaha/domain/repositories/repositories.dart';

final weatherApiProvider =
    Provider<WeatherRepository>((ref) => WeatherRepositoryOpenWeatherMap());
