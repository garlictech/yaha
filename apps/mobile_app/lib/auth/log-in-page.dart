import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: YahaBoxSizes.heightGeneral,
        title: Column(
          children: [
            Text(
              "Isn't it time you got outside?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: YahaFontSizes.medium, fontWeight: FontWeight.w500),
            ),
            Container(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                "Join us now!",
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(
                    left: YahaSpaceSizes.general,
                    right: YahaSpaceSizes.general,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: YahaSpaceSizes.large,
                        ),
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 400),
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xSmall,
                              bottom: YahaSpaceSizes.medium),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: YahaColors.textColor,
                                fontSize: YahaFontSizes.small),
                            decoration: InputDecoration(
                                labelText: 'Email',
                                contentPadding: EdgeInsets.only(
                                    left: YahaSpaceSizes.medium),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        YahaBorderRadius.small),
                                    borderSide: BorderSide(
                                        color: YahaColors.textColor,
                                        width: YahaBorderWidth.small)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        YahaBorderRadius.small),
                                    borderSide: BorderSide(
                                        color: YahaColors.secondary,
                                        width: YahaBorderWidth.small))),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 400),
                        padding: const EdgeInsets.only(
                          top: YahaSpaceSizes.small,
                          bottom: YahaSpaceSizes.general,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: !_passwordVisible,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: YahaColors.textColor,
                              fontSize: YahaFontSizes.small),
                          decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: YahaColors.textColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              contentPadding:
                                  EdgeInsets.only(left: YahaSpaceSizes.medium),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      YahaBorderRadius.small),
                                  borderSide: BorderSide(
                                      color: YahaColors.textColor,
                                      width: YahaBorderWidth.small)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      YahaBorderRadius.small),
                                  borderSide: BorderSide(
                                      color: YahaColors.secondary,
                                      width: YahaBorderWidth.small))),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(minWidth: 600),
                        child: SizedBox(
                          //width: YahaBoxSizes.buttonWidthBig,
                          height: YahaBoxSizes.buttonHeight,
                          child: ElevatedButton(
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {},
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
                        constraints: BoxConstraints(maxWidth: 400),
                        padding: EdgeInsets.only(
                            top: YahaSpaceSizes.xLarge,
                            bottom: YahaSpaceSizes.xLarge),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: YahaColors.textColor,
                                thickness: 2.0,
                                endIndent: 6.0,
                              ),
                            ),
                            Text(
                              'OR',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: YahaFontSizes.small),
                            ),
                            Expanded(
                              child: Divider(
                                color: YahaColors.textColor,
                                thickness: 2.0,
                                indent: 6.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.general),
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: YahaColors.facebook,
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
                            bottom: YahaSpaceSizes.general),
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: YahaColors.google,
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
                            bottom: YahaSpaceSizes.general),
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: YahaColors.apple,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          YahaBorderRadius.general))),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: YahaSpaceSizes.general,
                            right: YahaSpaceSizes.general,
                            bottom: YahaSpaceSizes.general),
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: YahaFontSizes.small)),
                              Text('Sign up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.primary,
                                      fontSize: YahaFontSizes.small)),
                            ],
                          ),
                        ),
                      ),
                    ],
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