import 'package:flutter_riverpod/flutter_riverpod.dart';

class YahaDefaults {
  final double smallGeoBufferSizeInMeters = 100;
  final double bigGeoBufferSizeInMeters = 1000;
  final double averageSpeedKmh = 4;
  final double poiImageSearchRadiusInMeters = 50;
}

final defaultsProvider = Provider<YahaDefaults>(
  (ref) => YahaDefaults(),
);
