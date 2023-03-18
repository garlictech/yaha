import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/data/auth/user_name.dart';
import 'package:yaha/ui/views/auth/widgets/avatar_image.dart';

import 'yaha-border-radius.dart';
import 'yaha-colors.dart';
import 'yaha-font-sizes.dart';
import 'yaha-space-sizes.dart';

class GlobalHeader extends ConsumerWidget {
  const GlobalHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(userNameProvider);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SizedBox(
                    height: 64,
                    width: 64,
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(YahaBorderRadius.xSmall),
                        child: TextButton(
                            onPressed: () {}, child: const AvatarImage()))),
                Container(
                    padding: const EdgeInsets.only(left: YahaSpaceSizes.medium),
                    child: Text(
                      'Hi $userName!',
                      style: const TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.textColor),
                    )),
              ],
            )),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            iconSize: YahaFontSizes.xxLarge,
            color: YahaColors.textColor,
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
