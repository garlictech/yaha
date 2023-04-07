import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'map_icon_button.dart';

class ResetToFeaturesButton extends ConsumerWidget {
  final MapController mapcontroller;
  final LatLngBounds originalBounds;

  const ResetToFeaturesButton({
    super.key,
    required this.mapcontroller,
    required this.originalBounds,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MapIconButton(
        onPressed: () {
          mapcontroller.fitBounds(originalBounds);
        },
        icon: Icons.restart_alt);
  }
}
