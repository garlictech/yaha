import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/map/buttons/layers_button.dart';
import 'package:yaha/ui/views/map/buttons/map_only_button.dart';

class LayersControl extends ConsumerWidget {
  static const size = 35.0;
  final VoidCallback onLayerPressed;
  final VoidCallback onMapOnlyPressed;
  final bool isMapOnly;

  const LayersControl(
      {super.key,
      required this.onLayerPressed,
      required this.onMapOnlyPressed,
      required this.isMapOnly});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MapOnlyButton(onPressed: onMapOnlyPressed, isActive: isMapOnly),
          LayersButton(
            onPressed: onLayerPressed,
          ),
        ]
            .map((widget) =>
                Padding(padding: const EdgeInsets.all(3), child: widget))
            .toList());
  }
}
