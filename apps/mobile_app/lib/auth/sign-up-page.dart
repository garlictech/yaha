import 'package:flutter/material.dart';
import 'package:yaha/auth/auth-state.dart';
import 'package:yaha/yaha-border-radius.dart';
import 'package:yaha/yaha-box-sizes.dart';
import 'package:yaha/yaha-colors.dart';
import 'package:yaha/yaha-font-sizes.dart';
import 'package:yaha/yaha-space-sizes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cognito/login_methods.dart';
import 'sign-up-with-email-page.dart';
import 'social-login.widget.dart';

@immutable
class SignUpPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authState = watch(authStateProvider);
    final loginMethod = authState.loginMethod;

    if (loginMethod != null) {
      return SocialLoginWidget(title: "Login to YAHA", method: loginMethod);
    } else {
      return SignUpPageBase();
    }
  }
}

@immutable
class SignUpPageBase extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authStateNotifier = watch(authStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: YahaBoxSizes.heightGeneral,
        title: Column(
          children: [
            Text(
              "New to Yaha?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: YahaFontSizes.xLarge, fontWeight: FontWeight.w700),
            ),
            Container(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                "Create an account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: YahaFontSizes.xLarge,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        flexibleSpace: Image.asset(
          'assets/images/top-picture.png',
          fit: BoxFit.cover,
          //width: MediaQuery.of(context).size.width,
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 195.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('New to YAHA?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w500)),
                  const Text(
                    "Create an account!",
                    style: TextStyle(
                        fontSize: YahaFontSizes.medium,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              background: Image.asset(
                'assets/images/top-picture.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          bottom: YahaSpaceSizes.general,
                          top: YahaSpaceSizes.large),
                      child: SizedBox(
                        height: YahaBoxSizes.buttonHeight,
                        width: YahaBoxSizes.buttonWidthBig,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                new MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) {
                              return new SignUpWithEmailPage();
                            }));
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
                                  'Sign up with email',
                                  style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //icon: Icon(
                          //Icons.mail_outline_rounded,
                          //color: YahaColors.accentColor,
                          //size: YahaFontSizes.large,
                          //),

                          //label: Text('Sign up with email',
                          //style: TextStyle(
                          //fontSize: YahaFontSizes.small,
                          //fontWeight: FontWeight.w600,
                          //)),
                          style: ElevatedButton.styleFrom(
                            primary: YahaColors.primary,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: YahaSpaceSizes.general),
                      child: SizedBox(
                        height: YahaBoxSizes.buttonHeight,
                        width: YahaBoxSizes.buttonWidthBig,
                        child: ElevatedButton(
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Image.asset(
                                    'assets/images/facebook_logo@3x.png',
                                    height: 28.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign up with Facebook',
                                  style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //icon: Icon(
                          //Icons.facebook_rounded,
                          //color: YahaColors.accentColor,
                          //size: YahaFontSizes.large,
                          //),
                          onPressed: () => authStateNotifier
                              .startSocialLogin(LoginMethod.FACEBOOK),
                          //label: Text('Sign up with Facebook',
                          //style: TextStyle(
                          //fontSize: YahaFontSizes.small,
                          //fontWeight: FontWeight.w600,
                          //)),
                          style: ElevatedButton.styleFrom(
                            primary: YahaColors.facebook,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: YahaSpaceSizes.general),
                      child: SizedBox(
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
                                  'Sign up with Google',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () => authStateNotifier
                              .startSocialLogin(LoginMethod.GOOGLE),
                          style: ElevatedButton.styleFrom(
                            primary: YahaColors.google,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: YahaSpaceSizes.general),
                      child: SizedBox(
                        height: YahaBoxSizes.buttonHeight,
                        width: YahaBoxSizes.buttonWidthBig,
                        child: ElevatedButton(
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Image.asset(
                                    'assets/images/apple_logo@3x.png',
                                    height: 26.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign up with Apple',
                                  style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //icon: Image.asset(
                          //'assets/images/apple_logo@3x.png',
                          //height: 25.0,
                          //),
                          onPressed: () => authStateNotifier
                              .startSocialLogin(LoginMethod.GOOGLE),
                          //label: Text('Sign up with Apple',
                          //style: TextStyle(
                          //fontSize: YahaFontSizes.small,
                          //fontWeight: FontWeight.w600,
                          //)),
                          style: ElevatedButton.styleFrom(
                            primary: YahaColors.apple,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: YahaFontSizes.small)),
                            Text('Log in',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.primary,
                                    fontSize: YahaFontSizes.small)),
                          ],
                        ),
                      ),
                    ),
                  ],
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
