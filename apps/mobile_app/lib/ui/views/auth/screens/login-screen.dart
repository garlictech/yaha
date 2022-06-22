import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/presenters/auth/login-screen-presenter.dart';

import '../../shared/shared.dart';
import '../widgets/apple-button.dart';
import '../widgets/facebook-button.dart';
import '../widgets/google-button.dart';

class LogInScreen extends ConsumerWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(loginScreenMVPProvider(context));
    final presenter = ref.watch(loginScreenMVPProvider(context).notifier);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: YahaSpaceSizes.general,
                      right: YahaSpaceSizes.general,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: const [
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
                              onPressed: presenter.doEmailLogin,
                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(Icons.mail_outline_rounded,
                                          color: YahaColors.accentColor,
                                          size: YahaIconSizes.large),
                                    ),
                                  ),
                                  const Align(
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
                                onPressed: presenter.doFacebookLogin)),
                        Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.medium),
                            child: GoogleButton(
                              title: 'Log in with Google',
                              onPressed: presenter.doGoogleLogin,
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.large),
                            child: AppleButton(
                              title: 'Log in with Apple',
                              onPressed: presenter.doAppleLogin,
                            )),
                        Container(
                          width: YahaBoxSizes.buttonWidthBig,
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.small),
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
                                    style: const TextStyle(
                                        color: YahaColors.textColor,
                                        fontSize: YahaFontSizes.small),
                                    children: [
                                      const TextSpan(
                                        text: 'I accept ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                          text: 'Terms & Conditions ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: YahaColors.primary),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {}),
                                      const TextSpan(
                                        text: 'and ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                          text: 'Privacy Policy',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: YahaColors.primary),
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
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                  color: YahaColors.textColor,
                                  fontSize: YahaFontSizes.small),
                              children: [
                                const TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                    text: 'Sign up',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.primary,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = presenter.doSignup),
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
