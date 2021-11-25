import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/presenters/auth/signup-with-email-screen-presenter.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/pop-ups/success-popup.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:yaha/utility/yaha-text-input-password.dart';
import 'package:yaha/utility/yaha-text-input-email.dart';

class SignupWithEmailScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final viewModel = watch(signupWithEmailMVPProvider(context));
    final presenter = watch(signupWithEmailMVPProvider(context).notifier);

    final bool passwordMismatch = !viewModel.passwordsMatch;

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Form(
                    key: _formKey,
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
                                  'Sign up with email',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 400),
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.xxLarge,
                                bottom: YahaSpaceSizes.general),
                            child: YahaTextFieldEmail(
                              title: 'Email',
                            ),
                          ),
                          Container(
                              constraints: BoxConstraints(maxWidth: 400),
                              padding: const EdgeInsets.only(
                                  bottom: YahaSpaceSizes.general),
                              child: YahaTextFieldPassword(
                                  title: 'Password',
                                  onChanged: (value) =>
                                      presenter.setPassword(value))),
                          Container(
                              constraints: BoxConstraints(maxWidth: 400),
                              padding: const EdgeInsets.only(
                                  bottom: YahaSpaceSizes.small),
                              child: YahaTextFieldPassword(
                                title: 'Password again',
                                onChanged: (value) =>
                                    presenter.setPasswordAgain(value),
                              )),
                          passwordMismatch
                              ? Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(
                                      bottom: YahaSpaceSizes.large),
                                  child: Text(
                                    "Password and password again is not matching",
                                    style: TextStyle(
                                        color: YahaColors.error,
                                        fontSize: YahaFontSizes.xSmall,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.only(
                                      bottom: YahaSpaceSizes.large),
                                ),
                          Container(
                            child: SizedBox(
                              width: YahaBoxSizes.buttonWidthBig,
                              height: YahaBoxSizes.buttonHeight,
                              child: ElevatedButton(
                                child: Text(
                                  'Sign up',
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
                                        return SuccessPopup(
                                            title: 'Hurray!',
                                            content:
                                                'Welcome to Yaha!\nThanks for choosing us.',
                                            buttonTitle: 'Go to dashboard');
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
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: YahaColors.primary,
                                  fontSize: YahaFontSizes.small),
                            ),
                          ),
                          Container(
                            width: YahaBoxSizes.buttonWidthBig,
                            padding: EdgeInsets.only(
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
                                                fontWeight: FontWeight.w600,
                                                color: YahaColors.primary),
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
                            padding:
                                EdgeInsets.only(top: YahaSpaceSizes.general),
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
