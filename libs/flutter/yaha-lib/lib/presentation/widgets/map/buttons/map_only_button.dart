import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/map/map.dart';
import 'map_icon_button.dart';

class MapOnlyButton extends ConsumerWidget {
  final String hikeId;

  const MapOnlyButton({super.key, required this.hikeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMapOnly = ref.watch(placesOnRouteMapControllerProvider(hikeId)
            .select((v) => switch (v) {
                  AsyncData(:final value) => value.isMapOnly,
                  _ => null,
                })) ??
        false;

    return MapIconButton(
        onPressed: () {
          ref
              .read(placesOnRouteMapControllerProvider(hikeId).notifier)
              .onMapOnlyPressed();
        },
        icon: isMapOnly ? Icons.map_outlined : Icons.map_sharp);
  }
}
