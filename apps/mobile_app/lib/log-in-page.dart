import 'package:flutter/material.dart';
import 'package:mobile_app/yaha-border-radius.dart';
import 'package:mobile_app/yaha-border-width.dart';
import 'package:mobile_app/yaha-colors.dart';
import 'package:mobile_app/yaha-font-sizes.dart';
import 'package:mobile_app/yaha-space-sizes.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _passwordVisible = false;

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
              title: Text("New to Yaha?\nCreate an account!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: YahaFontSizes.medium,
                      fontWeight: FontWeight.bold)),
              background: Image.asset(
                'assets/images/top-picture.png',
                fit: BoxFit.cover,
                //width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
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
                                bottom: YahaSpaceSizes.general),
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
                  ],
                );
              },
              childCount: 1,
            ),
          )
        ]));
  }
}
