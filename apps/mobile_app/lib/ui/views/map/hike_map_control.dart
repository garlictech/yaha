import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/map/reverse_hike_button.dart';

class HikeMapControl extends ConsumerWidget {
  static const size = 35.0;
  final String hikeId;

  const HikeMapControl({super.key, required this.hikeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ReverseHikeButton(hikeId: hikeId, size: size),
        ]);
  }
}
