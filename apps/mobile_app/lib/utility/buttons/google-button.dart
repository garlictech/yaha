import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/auth/cognito/auth-methods.dart';
import 'package:yaha/auth/domain/auth-state.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';

class GoogleButton extends ConsumerWidget {
  final String title;

  const GoogleButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var authNotifier = watch(authStateProvider.notifier);
    return SizedBox(
      height: YahaBoxSizes.buttonHeight,
      width: YahaBoxSizes.buttonWidthBig,
      child: ElevatedButton(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/btn_google_dark_normal_ios@3x.png',
                height: 40.0,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: YahaFontSizes.small,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        onPressed: () {
          authNotifier.loginWith(AuthMethod.GOOGLE);
        },
        style: ElevatedButton.styleFrom(
          primary: YahaColors.google,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(YahaBorderRadius.general))),
        ),
      ),
    );
  }
}
