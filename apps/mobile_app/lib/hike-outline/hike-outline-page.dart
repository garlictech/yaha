import 'package:flutter/material.dart';
import 'package:yaha/hike-outline/checkpoint.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/buttons/filter-button.dart';
import 'package:yaha/utility/buttons/settings-button.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class HikeOutlinePage extends StatefulWidget {
  @override
  _HikeOutlineState createState() => _HikeOutlineState();
}

class _HikeOutlineState extends State<HikeOutlinePage> {
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
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: YahaSpaceSizes.medium,
                          right: YahaSpaceSizes.medium,
                          top: YahaSpaceSizes.small,
                          bottom: YahaSpaceSizes.large,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: YahaBackButton(),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text('Hike Outline',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.large,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SettingsButton(),
                            ),
                            Positioned(
                              right: 55.0,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: FilterButton(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Checkpoint(
                        title: "Home",
                        boxBackgorundColor: YahaColors.secondary,
                        backgroundColor: YahaColors.secondary,
                        icon: Icons.outlined_flag_rounded,
                        iconSize: 40,
                        estimatedArrival: "11:30",
                      )
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
