import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaha/device/states/current_location_state.dart';
import 'package:yaha/ui/views/auth/avatar_image.dart';
import 'package:yaha/ui/views/map/leaflet_map_widgets.dart';

part 'global_markers.g.dart';

@riverpod
class GlobalMarkers extends _$GlobalMarkers {
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );

  @override
  List<Marker>? build() {
    final currentLocation = ref.watch(currentLocationStateProvider);
    final currentLocationMarker = currentLocation == null
        ? null
        : _currentLocationMarker(
            currentLocation.latitude, currentLocation.longitude);

    final allMarkers = [
      if (currentLocationMarker != null) currentLocationMarker
    ];
    return allMarkers.isEmpty ? null : allMarkers;
  }

  Marker _currentLocationMarker(double latitude, double longitude) {
    const markerSize = roundMarkerSize;
    return Marker(
        height: markerSize,
        width: markerSize,
        point: LatLng(latitude, longitude),
        builder: (context) {
          return const PhysicalModel(
              color: Colors.black,
              shadowColor: Colors.black,
              elevation: 8.0,
              shape: BoxShape.circle,
              child: AvatarImage());
        });
  }
}
