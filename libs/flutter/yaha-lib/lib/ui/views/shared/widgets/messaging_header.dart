import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_yaha_lib/data/auth/user_name.dart';
import 'package:flutter_yaha_lib/ui/views/auth/avatar_image.dart';
import 'package:flutter_yaha_lib/ui/views/screens/account-screen.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';

class MessagingHeader extends ConsumerWidget {
  const MessagingHeader({super.key});

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
                InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const AccountScreen(), withNavBar: false);
                    },
                    child: const SizedBox(
                        height: 50, width: 50, child: AvatarImage())),
                Container(
                    padding: const EdgeInsets.only(left: YahaSpaceSizes.medium),
                    child: Text(
                      'Hi $userName!',
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
              ],
            )),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            iconSize: YahaFontSizes.xxLarge,
            color: YahaColors.textColor,
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const SuccessPopup(
                      title: "Messages",
                      content: "You have 0 messages.",
                      buttonTitle: "Close"));
            },
          ),
        ),
      ],
    );
  }
}
