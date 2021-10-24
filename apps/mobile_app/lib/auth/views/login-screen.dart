import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/settings/application/app-settings-state.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

import '../presenters/login-screen-presenter.dart';

import 'apple-button.dart';
import 'facebook-button.dart';
import 'google-button.dart';
import 'login-with-email-popup.dart';
import 'signup-popup.dart';

class LogInScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var appSettingsState = watch(applicationSettingsStateProvider);
    var appSettingsStateNotifier =
        watch(applicationSettingsStateProvider.notifier);

    final presenter = watch(loginScreenMVPProvider.notifier);

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: YahaSpaceSizes.general,
                      right: YahaSpaceSizes.general,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: YahaBackButton(),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.medium,
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.textColor),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xxLarge),
                          child: SizedBox(
                            height: YahaBoxSizes.buttonHeight,
                            width: YahaBoxSizes.buttonWidthBig,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LogInWithEmailPopup()));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.mail_outline_rounded,
                                        color: YahaColors.accentColor,
                                        size: YahaFontSizes.xLarge,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Log in with email',
                                      style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: YahaColors.primary,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            YahaBorderRadius.general))),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.medium,
                                bottom: YahaSpaceSizes.medium),
                            child: FacebookButton(
                                title: 'Log in with Facebook',
                                onPressed: () =>
                                    presenter.doFacebookLogin(context))),
                        Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.medium),
                            child: GoogleButton(
                              title: 'Log in with Google',
                              onPressed: () => presenter.doGoogleLogin(context),
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.large),
                            child: AppleButton(
                              title: 'Log in with Apple',
                              onPressed: () => presenter.doAppleLogin(context),
                            )),
                        Container(
                          width: YahaBoxSizes.buttonWidthBig,
                          padding:
                              EdgeInsets.only(bottom: YahaSpaceSizes.small),
                          child: Row(
                            children: [
                              Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) => YahaColors.textColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        YahaBorderRadius.checkboxSmall),
                                  ),
                                  value: appSettingsState.isChecked,
                                  onChanged: (value) => appSettingsStateNotifier
                                      .updateCheckboxState(value)),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: YahaColors.textColor,
                                        fontSize: YahaFontSizes.small),
                                    children: [
                                      TextSpan(
                                        text: 'I accept ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                          text: 'Terms & Conditions ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {}),
                                      TextSpan(
                                        text: 'and ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                          text: 'Privacy Policy',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {}),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: YahaSpaceSizes.general),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  color: YahaColors.textColor,
                                  fontSize: YahaFontSizes.small),
                              children: [
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.primary,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpPopup()));
                                      }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
