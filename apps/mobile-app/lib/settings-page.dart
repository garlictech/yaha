import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/yaha-border-radius.dart';
import 'package:mobile_app/yaha-colors.dart';
import 'package:mobile_app/yaha-font-sizes.dart';
import 'package:mobile_app/yaha-space-sizes.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                      child: Row(
                    //mainAxisAlignment: MainAxisAlignment
                    //  .spaceBetween, //Center Row contents horizontally,

                    children: [
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        size: YahaFontSizes.large,
                        color: YahaColors.textColor,
                      ),
                      Text('Settings',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: YahaFontSizes.large,
                              fontWeight: FontWeight.w600,
                              color: YahaColors.textColor)),
                    ],
                  )),
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
