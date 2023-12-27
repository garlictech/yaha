import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_yaha_lib/domain/calculations/add_padding_to_bounds.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:latlong2/latlong.dart';

LatLngBounds getHikeBounds(Hike hike) {
  final firstBoundary = hike.route.coordinates.first.location;
  final lastBoundary = hike.route.coordinates.last.location;
  final corner1 = LatLng(firstBoundary.latitude, firstBoundary.longitude);
  final corner2 = LatLng(lastBoundary.latitude, lastBoundary.longitude);
  final bounds = LatLngBounds(corner1, corner2);

  for (var point in hike.route.coordinates) {
    bounds.extend(LatLng(point.location.latitude, point.location.longitude));
  }

  final paddedBounds = addPaddingToBounds(bounds, 0.2);

  return paddedBounds;
}
