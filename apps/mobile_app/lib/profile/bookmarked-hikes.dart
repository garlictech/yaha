import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/hike/hike-card/hike-card.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class BookmarkedHikes extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: Text(
          'Bookmarked hikes',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: YahaFontSizes.medium,
            color: YahaColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: YahaBackButton(),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.general,
                            right: YahaSpaceSizes.general,
                            left: YahaSpaceSizes.general),
                        child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          primary: false,
                          crossAxisSpacing: YahaSpaceSizes.general,
                          mainAxisSpacing: YahaSpaceSizes.general,
                          children: [
                            HikeCard(
                              title: 'Budapest',
                              subTitle: 'Várhegy, Duna, Lánchid',
                              backgroundImage: 'assets/images/budapest.png',
                            ),
                            HikeCard(
                              title: 'Tura',
                              subTitle: 'Túrázás, vár, erdő, és barlang',
                              backgroundImage: 'assets/images/tura.png',
                            ),
                            HikeCard(
                              title: 'Mátra',
                              subTitle: 'Mátra, erdős hegyek túrázáshoz',
                              backgroundImage: 'assets/images/matra.png',
                            ),
                            HikeCard(
                              title: 'Balaton',
                              subTitle: 'Nagy édesvizű tó üdülővárosokkal',
                              backgroundImage: 'assets/images/balaton.png',
                            ),
                            HikeCard(
                              title: 'Budapest',
                              subTitle: 'Várhegy, Duna, Lánchid',
                              backgroundImage: 'assets/images/budapest.png',
                            ),
                            HikeCard(
                              title: 'Balaton',
                              subTitle: 'Nagy édesvizű tó üdülővárosokkal',
                              backgroundImage: 'assets/images/balaton.png',
                            ),
                          ],
                        ),
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
