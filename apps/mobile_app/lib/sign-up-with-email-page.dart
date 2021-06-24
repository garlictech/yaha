import 'package:flutter/material.dart';
import 'package:mobile_app/yaha-border-radius.dart';
import 'package:mobile_app/yaha-border-width.dart';
import 'package:mobile_app/yaha-box-sizes.dart';
import 'package:mobile_app/yaha-colors.dart';
import 'package:mobile_app/yaha-font-sizes.dart';
import 'package:mobile_app/yaha-space-sizes.dart';

class SignUpWithEmailPage extends StatefulWidget {
  @override
  _SignUpWithEmailPageState createState() => _SignUpWithEmailPageState();
}

class _SignUpWithEmailPageState extends State<SignUpWithEmailPage> {
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
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              YahaBorderRadius.small),
                                          borderSide: BorderSide(
                                              color: YahaColors.textColor,
                                              width: YahaBorderWidth.small))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
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
