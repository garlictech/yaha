import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_yaha_lib/app/geolocation-providers.dart';

import 'map_icon_button.dart';

class JumpToCurrentLocationButton extends ConsumerWidget {
  final MapController mapcontroller;
  const JumpToCurrentLocationButton({super.key, required this.mapcontroller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MapIconButton(
        onPressed: () async {
          final currentLocation = await ref
              .read(geoLocationRepositoryProvider)
              .getCurrentLocation();

          mapcontroller.move(
              LatLng(currentLocation.latitude, currentLocation.longitude),
              mapcontroller.zoom);
        },
        icon: Icons.gps_fixed);
  }
}
