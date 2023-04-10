import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'map_icon_button.dart';

class PoiFilterButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const PoiFilterButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MapIconButton(onPressed: onPressed, icon: Icons.place_sharp);
  }
}
