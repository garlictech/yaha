import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/app/geolocation-providers.dart';

class JumpToCurrentLocationButton extends ConsumerWidget {
  final MapController mapcontroller;
  final double size;
  const JumpToCurrentLocationButton(
      {super.key, required this.mapcontroller, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        iconSize: size,
        onPressed: () async {
          final currentLocation = await ref
              .read(geoLocationRepositoryProvider)
              .getCurrentLocation();

          mapcontroller.move(
              LatLng(currentLocation.latitude, currentLocation.longitude),
              mapcontroller.zoom);
        },
        icon: Icon(Icons.gps_fixed, color: Theme.of(context).primaryColor));
  }
}
