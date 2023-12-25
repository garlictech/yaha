import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'map_icon_button.dart';

class ReverseHikeButton extends ConsumerWidget {
  final String hikeId;

  const ReverseHikeButton({super.key, required this.hikeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MapIconButton(
        onPressed: () {
          ref
              .read(hikingSettingsServiceProvider(hikeId).notifier)
              .reverseHike();
        },
        icon: FontAwesomeIcons.arrowsUpDown);
  }
}
