import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/ui/views/map/buttons/reverse_hike_button.dart';
import 'package:flutter_yaha_lib/ui/views/map/buttons/show_pois_around_hike_button.dart';

class HikeMapControl extends ConsumerWidget {
  static const size = 35.0;
  final String hikeId;

  const HikeMapControl({super.key, required this.hikeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ReverseHikeButton(hikeId: hikeId),
              ShowPoisAroundHikeButton(hikeId: hikeId),
            ]
                .map((widget) =>
                    Padding(padding: const EdgeInsets.all(3), child: widget))
                .toList()));
  }
}
