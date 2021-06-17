import 'package:flutter/material.dart';
import 'package:mobile_app/yaha-border-radius.dart';
import 'package:mobile_app/yaha-colors.dart';
import 'package:mobile_app/yaha-font-sizes.dart';
import 'package:mobile_app/yaha-space-sizes.dart';

class EventDetailPage extends StatefulWidget {
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
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
                  child:
                    Container(
                      child: Row(
                        children: [
                          Icon(
                              Icons.arrow_back_ios_rounded,
                              size: YahaFontSizes.large,
                              color: YahaColors.textColor,
                            ),
                          Text('Eger Csillaga Teljesítmény Túra',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                    fontSize: YahaFontSizes.xLarge,
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.textColor)),
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