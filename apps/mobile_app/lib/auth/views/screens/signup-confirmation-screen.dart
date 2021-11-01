import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class SignupConfirmationScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
                                'Confirm sign up',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.medium,
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.textColor),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xxLarge,
                              bottom: YahaSpaceSizes.xxLarge),
                          child: Text(
                            'Enter the 6 digit code we sent you via email to finish sign up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: YahaColors.textColor,
                              fontSize: YahaFontSizes.small,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        //VerificationCode(onCompleted: onCompleted, onEditing: onEditing),
                        VerificationCode(
                            onCompleted: (_value) {}, onEditing: (_value) {}),
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xxLarge),
                          child: SizedBox(
                            height: YahaBoxSizes.buttonHeight,
                            width: YahaBoxSizes.buttonWidthBig,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Confirm sign up',
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
                          padding: EdgeInsets.only(top: YahaSpaceSizes.general),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  color: YahaColors.textColor,
                                  fontSize: YahaFontSizes.small),
                              children: [
                                TextSpan(
                                  text: "Didn't get the code? ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Resend code',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.primary,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
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
