import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

LatLngBounds addPaddingToBounds(LatLngBounds bounds, double paddingFactor) {
  // Calculate new latitude span with padding
  double latPadding =
      (bounds.northEast.latitude - bounds.southWest.latitude) * paddingFactor;
  double newNorthLat = bounds.northEast.latitude + latPadding;
  double newSouthLat = bounds.southWest.latitude - latPadding;

  // Calculate new longitude span with padding
  double lngPadding =
      (bounds.northEast.longitude - bounds.southWest.longitude) * paddingFactor;
  double newEastLng = bounds.northEast.longitude + lngPadding;
  double newWestLng = bounds.southWest.longitude - lngPadding;

  // Create new padded bounds
  LatLngBounds newBounds = LatLngBounds(
    LatLng(newNorthLat, newEastLng),
    LatLng(newSouthLat, newWestLng),
  );

  return newBounds;
}
