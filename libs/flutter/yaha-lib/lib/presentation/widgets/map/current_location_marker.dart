import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_yaha_lib/ui/views/auth/avatar_image.dart';

Marker currentLocationMarker(GeoPoint location) {
  const markerSize = 50.0;
  return Marker(
      height: markerSize,
      width: markerSize,
      point: LatLng(location.latitude, location.longitude),
      child: const AvatarImage());
}
