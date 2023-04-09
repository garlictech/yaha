import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'map_icon_button.dart';

class MapOnlyButton extends ConsumerWidget {
  final VoidCallback onPressed;
  final bool isActive;

  const MapOnlyButton(
      {super.key, required this.onPressed, required this.isActive});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MapIconButton(
        onPressed: onPressed,
        icon: isActive ? Icons.map_outlined : Icons.map_sharp);
  }
}
