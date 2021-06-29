//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:mobile_app/yaha-border-radius.dart';
import 'package:mobile_app/yaha-colors.dart';
import 'package:mobile_app/yaha-font-sizes.dart';
import 'package:mobile_app/yaha-space-sizes.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Text("New to Yaha?",
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
                        height: 50,
                        width: 400,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.timeline,
                            color: YahaColors.accentColor,
                            size: YahaFontSizes.large,
                          ),
                          onPressed: () {},
                          label: Text('Sign up with email',
                              style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                              )),
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
                        height: 50,
                        width: 400,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.facebook_rounded,
                            color: YahaColors.accentColor,
                            size: YahaFontSizes.large,
                          ),
                          onPressed: () {},
                          label: Text('Sign up with Facebook',
                              style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                              )),
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
                        height: 50,
                        width: 400,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.timeline,
                            color: YahaColors.accentColor,
                            size: YahaFontSizes.large,
                          ),
                          onPressed: () {},
                          label: Text('Sign up with Google',
                              style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                              )),
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
                        height: 50,
                        width: 400,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.timeline,
                            color: YahaColors.accentColor,
                            size: YahaFontSizes.large,
                          ),
                          onPressed: () {},
                          label: Text('Sign up with Apple',
                              style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                              )),
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
                          children: [
                            Text('Already have an account?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: YahaFontSizes.small)),
                            Text('Log in',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
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
