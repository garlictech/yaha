import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../buttons/layers_button.dart';
import '../buttons/map_only_button.dart';

class LayersControl extends ConsumerWidget {
  static const size = 35.0;
  final VoidCallback onLayerPressed;
  final String hikeId;

  const LayersControl(
      {super.key, required this.onLayerPressed, required this.hikeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MapOnlyButton(hikeId: hikeId),
          LayersButton(
            onPressed: onLayerPressed,
          ),
        ]
            .map((widget) =>
                Padding(padding: const EdgeInsets.all(3), child: widget))
            .toList());
  }
}
