import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/data/data.dart';
import 'package:flutter_yaha_lib/domain/repositories/repositories.dart';

final geoLocationRepositoryProvider =
    Provider<GeoLocationRepository>((ref) => GeoLocationRepositoryGeoLocator());
