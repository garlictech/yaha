import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_yaha_lib/app/app.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../widgets/auth/avatar_image.dart';
import 'parameters.dart';

part 'global_markers.g.dart';

@riverpod
class GlobalMarkers extends _$GlobalMarkers {
  @override
  Future<List<Marker>> build() async {
    final currentLocation =
        await ref.watch(currentLocationStreamProvider.future);

    final currentLocationMarker = _currentLocationMarker(
        currentLocation.latitude, currentLocation.longitude);

    final allMarkers = [currentLocationMarker];

    return allMarkers;
  }

  Marker _currentLocationMarker(double latitude, double longitude) {
    const markerSize = roundMarkerSize;
    return Marker(
        height: markerSize,
        width: markerSize,
        point: LatLng(latitude, longitude),
        child: const PhysicalModel(
            color: Colors.black,
            shadowColor: Colors.black,
            elevation: 8.0,
            shape: BoxShape.circle,
            child: AvatarImage()));
  }
}
