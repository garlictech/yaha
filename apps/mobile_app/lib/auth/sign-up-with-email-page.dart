import 'package:flutter/material.dart';
import 'package:yaha/yaha-border-radius.dart';
import 'package:yaha/yaha-border-width.dart';
import 'package:yaha/yaha-box-sizes.dart';
import 'package:yaha/yaha-colors.dart';
import 'package:yaha/yaha-font-sizes.dart';
import 'package:yaha/yaha-space-sizes.dart';

class SignUpWithEmailPage extends StatefulWidget {
  @override
  _SignUpWithEmailPageState createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> {
  bool _passwordVisible = false;
  bool _passwordAgainVisible = false;

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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(
                      width: 300.0,
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: YahaSpaceSizes.large),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.xSmall,
                                  bottom: YahaSpaceSizes.medium),
                              child: SizedBox(
                                height: 40.0,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  autocorrect: false,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: YahaColors.textColor,
                                      fontSize: YahaFontSizes.small),
                                  decoration: InputDecoration(
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
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.xSmall,
                                bottom: YahaSpaceSizes.medium),
                            child: SizedBox(
                              height: 40.0,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: YahaColors.textColor,
                                    fontSize: YahaFontSizes.small),
                                decoration: InputDecoration(
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
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.xSmall,
                                bottom: YahaSpaceSizes.medium),
                            child: SizedBox(
                              height: 40.0,
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
                          // SizedBox(
                          //   width: 300.0,
                          //   child: Container(
                          //     padding: const EdgeInsets.only(
                          //         bottom: YahaSpaceSizes.medium),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text('At least 8 characters long'),
                          //         Text('Contains numbers'),
                          //         Text('Contains special characters')
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password again',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.xSmall,
                                bottom: YahaSpaceSizes.large),
                            child: SizedBox(
                              height: 40.0,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: !_passwordAgainVisible,
                                enableSuggestions: false,
                                autocorrect: false,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: YahaColors.textColor,
                                    fontSize: YahaFontSizes.small),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordAgainVisible
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        color: YahaColors.textColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _passwordAgainVisible =
                                              !_passwordAgainVisible;
                                        });
                                      },
                                    ),
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
                        ],
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
                                    Radius.circular(YahaBorderRadius.general))),
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
