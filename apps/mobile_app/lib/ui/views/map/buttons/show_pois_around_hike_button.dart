import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/map/places_on_route_map_controller.dart';

import 'map_icon_button.dart';

class ShowPoisAroundHikeButton extends ConsumerWidget {
  final String hikeId;

  const ShowPoisAroundHikeButton({super.key, required this.hikeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onPressed() {
      ref
          .read(placesOnRouteMapControllerProvider(hikeId).notifier)
          .toggleOffroutePois();
    }

    return MapIconButton(onPressed: onPressed, icon: Icons.add_circle);
  }
}
