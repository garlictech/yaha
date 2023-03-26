import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'jump_to_current_location_button.dart';
import 'reset_to_features_button.dart';

class GlobalMapControl extends ConsumerWidget {
  static const size = 35.0;
  final MapController mapcontroller;
  final LatLngBounds originalBounds;

  const GlobalMapControl(
      {super.key, required this.mapcontroller, required this.originalBounds});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      JumpToCurrentLocationButton(mapcontroller: mapcontroller, size: size),
      ResetToFeaturesButton(
          mapcontroller: mapcontroller,
          originalBounds: originalBounds,
          size: size),
    ]);
  }
}
