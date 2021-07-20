import 'package:flutter/material.dart';
import 'package:yaha/hike-card.dart';
import 'package:yaha/yaha-colors.dart';
import 'package:yaha/yaha-font-sizes.dart';
import 'package:yaha/yaha-space-sizes.dart';

class PreviousActivitiesPage extends StatefulWidget {
  @override
  _PreviousActivitiesState createState() => _PreviousActivitiesState();
}

class _PreviousActivitiesState extends State<PreviousActivitiesPage> {
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
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.general),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              iconSize: YahaFontSizes.xxLarge,
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: YahaColors.textColor,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              'Previous activities',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.large,
                                  fontWeight: FontWeight.w600,
                                  color: YahaColors.textColor),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/images/filter-icon.png',
                                width: 28.0,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: HikeCard(),
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
