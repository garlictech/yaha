import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../places_on_route_map_controller.dart';
import 'map_icon_button.dart';

class MapOnlyButton extends ConsumerWidget {
  final String hikeId;

  const MapOnlyButton({super.key, required this.hikeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMapOnly = ref.watch(placesOnRouteMapControllerProvider(hikeId)
        .select((value) => value.isMapOnly));

    return MapIconButton(
        onPressed: () {
          ref
              .read(placesOnRouteMapControllerProvider(hikeId).notifier)
              .onMapOnlyPressed();
        },
        icon: isMapOnly ? Icons.map_outlined : Icons.map_sharp);
  }
}
