import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetToFeaturesButton extends ConsumerWidget {
  final MapController mapcontroller;
  final LatLngBounds originalBounds;
  final double size;

  const ResetToFeaturesButton(
      {super.key,
      required this.mapcontroller,
      required this.originalBounds,
      required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        iconSize: size,
        onPressed: () {
          mapcontroller.fitBounds(originalBounds);
        },
        icon: Icon(Icons.restart_alt, color: Theme.of(context).primaryColor));
  }
}
