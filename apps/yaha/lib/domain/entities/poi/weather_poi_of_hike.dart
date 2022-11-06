import 'dart:core';
import '../weather/weather.dart';
import 'poi_of_hike.dart';

class WeatherPoiOfHike extends PoiOfHike {
  final Weather weather;

  WeatherPoiOfHike({
    required super.poi,
    required super.hike,
    required super.ref,
    required super.settings,
    required this.weather,
  });
}
