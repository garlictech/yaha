import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/map/map.dart';
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
