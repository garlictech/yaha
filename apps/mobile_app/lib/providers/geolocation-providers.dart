import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/device/devices.dart';
import 'package:yaha/domain/repositories/repositories.dart';

final geoLocationRepositoryProvider =
    Provider<GeoLocationRepository>((ref) => GeoLocationRepositoryImpl());
