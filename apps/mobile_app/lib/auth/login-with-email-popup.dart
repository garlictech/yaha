import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/auth/signup-popup.dart';
import 'package:yaha/settings/application/app-settings-state.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:yaha/utility/yaha-text-input-password.dart';
import 'package:yaha/utility/yaha-text-input.dart';

class LogInWithEmailPopup extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var appSettingsState = watch(applicationSettingsStateProvider);
    var appSettingsStateNotifier =
        watch(applicationSettingsStateProvider.notifier);

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
                            constraints: BoxConstraints(maxWidth: 400),
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.xxLarge,
                                bottom: YahaSpaceSizes.general),
                            child: YahaTextField(
                              title: 'Email',
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 400),
                            padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general,
                            ),
                            child: YahaTextFieldPassword(title: 'Password'),
                          ),
                          Container(
                            child: SizedBox(
                              width: YahaBoxSizes.buttonWidthBig,
                              height: YahaBoxSizes.buttonHeight,
                              child: ElevatedButton(
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600),
                                ),
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  } Scaffold.of(context).showSnackBar(SnackBar(content: Text('Everything is good')));
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
                            padding:
                                const EdgeInsets.only(top: YahaSpaceSizes.medium),
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
                            alignment: FractionalOffset.bottomCenter,
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
