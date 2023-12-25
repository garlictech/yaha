import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/ui/views/map/places_on_route_map_controller.dart';

import 'map_icon_button.dart';

class PoiFilterButton extends ConsumerWidget {
  final String hikeId;

  const PoiFilterButton({
    super.key,
    required this.hikeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MapIconButton(
        onPressed: () {
          ref
              .read(placesOnRouteMapControllerProvider(hikeId).notifier)
              .onPoiFilterPressed();
        },
        icon: Icons.place_sharp);
  }
}
