import 'package:flutter/material.dart';
import 'package:yaha/hike/hike-card-list.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class SearchResultPage extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResultPage> {
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
                              'Search results',
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
                        //height: MediaQuery.of(context).size.height,
                        height: 800,
                        child: HikeCardList(),
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