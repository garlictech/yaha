import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReverseHikeButton extends ConsumerWidget {
  final String hikeId;
  final double size;

  const ReverseHikeButton(
      {super.key, required this.hikeId, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        iconSize: size,
        onPressed: () {
          ref
              .read(hikingSettingsServiceProvider(hikeId).notifier)
              .reverseHike();
        },
        icon: FaIcon(FontAwesomeIcons.arrowsUpDown,
            color: Theme.of(context).primaryColor));
  }
}
