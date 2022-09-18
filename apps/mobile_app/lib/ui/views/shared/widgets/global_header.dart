import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/states/auth/auth-state.dart';
import 'package:yaha/domain/states/user/user-state.dart';

import 'yaha-border-radius.dart';
import 'yaha-colors.dart';
import 'yaha-font-sizes.dart';
import 'yaha-space-sizes.dart';

class GlobalHeader extends ConsumerWidget {
  const GlobalHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue userState = ref.watch(userStateProvider);
    final authState = ref.watch(authStateProvider);
    final authStateNotifier = ref.watch(authStateProvider.notifier);

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
                          onPressed: () {
                            showAlertDialog(context, authStateNotifier);
                          },
                          child: userState.when(
                              loading: () => const CircularProgressIndicator(),
                              error: (err, stack) => const Text('😱'),
                              data: (state) => Image.asset(
                                    state.avatarImage,
                                    fit: BoxFit.cover,
                                  ))),
                    )),
                Container(
                    padding: const EdgeInsets.only(left: YahaSpaceSizes.medium),
                    child: userState.when(
                      loading: () => const CircularProgressIndicator(),
                      error: (err, stack) => const Text('😱'),
                      data: (state) => Text(
                        'Hi ${state.nick}!',
                        style: const TextStyle(
                            fontSize: YahaFontSizes.medium,
                            fontWeight: FontWeight.w600,
                            color: YahaColors.textColor),
                      ),
                    )),
                ...(authState.loggedIn
                    ? [
                        TextButton(
                          child: const Text("Logout"),
                          onPressed: () => authStateNotifier.logout(),
                        )
                      ]
                    : [])
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

  showAlertDialog(BuildContext context, authStateNotifier) {
    Widget continueButton = TextButton(
      child: const Text("OK, I'm logged in"),
      onPressed: () {
        Navigator.of(context).pop();
        authStateNotifier.loggedIn();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Login effect simulator"),
      content: const Text(
          "Ok, the login window was up, you logged in successfully.."),
      actions: [
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
