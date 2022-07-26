import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/presenters/auth/login-with-email-screen-presenter.dart';

import '../../shared/shared.dart';

class LogInWithEmailScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  LogInWithEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(loginWithEmailMVPProvider(context));
    final presenter = ref.watch(loginWithEmailMVPProvider(context).notifier);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Form(
                    key: _formKey,
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
                                  'Log in with email',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 400),
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.xxLarge,
                                bottom: YahaSpaceSizes.general),
                            child: const YahaTextFieldEmail(
                              title: 'Email',
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 400),
                            padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general,
                            ),
                            child:
                                const YahaTextFieldPassword(title: 'Password'),
                          ),
                          Container(
                            child: SizedBox(
                              width: YahaBoxSizes.buttonWidthBig,
                              height: YahaBoxSizes.buttonHeight,
                              child: ElevatedButton(
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600),
                                ),
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const SuccessPopup(
                                          title: 'Welcome back!',
                                          content: 'You are logged in now.',
                                          buttonTitle: 'Go to dashboard',
                                        );
                                      });
                                },
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
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.medium),
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: YahaColors.primary,
                                  fontSize: YahaFontSizes.small),
                            ),
                          ),
                          Container(
                            width: YahaBoxSizes.buttonWidthBig,
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.small,
                                top: YahaSpaceSizes.large),
                            child: Row(
                              children: [
                                Checkbox(
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
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
                            alignment: FractionalOffset.bottomCenter,
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
