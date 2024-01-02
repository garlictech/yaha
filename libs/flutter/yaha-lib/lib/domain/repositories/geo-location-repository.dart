import '../value_objects/geo_location.dart';

abstract class GeoLocationRepository {
  Future<GeoLocation> getCurrentLocation();
  Stream<GeoLocation> watchCurrentLocation();
}
