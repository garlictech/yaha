import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:yaha/utility/yaha-text-input-password.dart';
import 'package:yaha/utility/yaha-text-input-email.dart';
import 'package:yaha/utility/yaha-text-input.dart';

class SignUpWithEmailPage extends StatefulWidget {
  @override
  _SignUpWithEmailPageState createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: YahaBoxSizes.heightGeneral,
        title: Column(
          children: [
            Text(
              "New to Yaha?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: YahaFontSizes.large,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                "Create an account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: YahaFontSizes.large,
                  fontWeight: FontWeight.w700,
                 ),
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
                  padding: const EdgeInsets.only(
                    left: YahaSpaceSizes.general,
                    right: YahaSpaceSizes.general,
                  ),
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 400),
                        padding:
                            const EdgeInsets.only(top: YahaSpaceSizes.large),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xSmall,
                              bottom: YahaSpaceSizes.medium),
                          child: YahaTextField(title: 'Name'),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 400),
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.small,
                            bottom: YahaSpaceSizes.medium),
                        child: YahaTextFieldEmail(title: 'Email'),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 400),
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.small,
                            bottom: YahaSpaceSizes.medium),
                        child: YahaTextFieldPassword(
                          title: 'Password',
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 400),
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.small,
                            bottom: YahaSpaceSizes.large),
                        child: YahaTextFieldPassword(
                          title: 'Password again',
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          width: 300.0,
                          height: 50.0,
                          child: ElevatedButton(
                            child: Text(
                              'Sign up',
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
                        //child: Align(
                        //alignment: FractionalOffset.bottomCenter,
                        padding: EdgeInsets.all(YahaSpaceSizes.general),
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
                      //),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
