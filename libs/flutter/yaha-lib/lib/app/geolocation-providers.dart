import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/device/devices.dart';
import 'package:flutter_yaha_lib/domain/repositories/repositories.dart';

final geoLocationRepositoryProvider =
    Provider<GeoLocationRepository>((ref) => GeoLocationRepositoryImpl());
