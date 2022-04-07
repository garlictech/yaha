import 'package:flutter_riverpod/flutter_riverpod.dart';

class YahaDefaults {
  final double smallGeoBufferSizeInMeters = 100;
}

final defaultsProvider = Provider<YahaDefaults>(
  (ref) => YahaDefaults(),
);
