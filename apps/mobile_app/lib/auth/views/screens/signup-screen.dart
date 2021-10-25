import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

import '../../presenters/signup-screen-presenter.dart';
import '../widgets/apple-button.dart';
import '../widgets/facebook-button.dart';
import '../widgets/google-button.dart';

class SignupScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(signupScreenMVPProvider(context));
    final presenter = watch(signupScreenMVPProvider(context).notifier);

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
                                'Sign up',
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
                              onPressed: presenter.doEmailSignup,
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
                                      'Sign up with email',
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
                                title: 'Sign up with Facebook',
                                onPressed: presenter.doFacebookLogin)),
                        Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.medium),
                            child: GoogleButton(
                              title: 'Sign up with Google',
                              onPressed: presenter.doGoogleLogin,
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.large),
                            child: AppleButton(
                              title: 'Sign up with Apple',
                              onPressed: presenter.doAppleLogin,
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
                                  value: viewModel.termsAccepted,
                                  onChanged: (value) =>
                                      presenter.termsAccepted = value),
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
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                    text: 'Log in',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.primary,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = presenter.doLogin),
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
