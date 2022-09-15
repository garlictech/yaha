import 'package:flutter_riverpod/flutter_riverpod.dart';

class YahaDefaults {
  final double smallGeoBufferSizeInMeters = 100;
  final double bigGeoBufferSizeInMeters = 1000;
  final double averageSpeedKmh = 4;
  final int poiImageSearchRadiusInMeters = 50;
  final int searchRadiusInMeters = 50000;
}

final defaultsProvider = Provider<YahaDefaults>(
  (ref) => YahaDefaults(),
);
