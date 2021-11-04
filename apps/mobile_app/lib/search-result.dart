import 'package:flutter/material.dart';
import 'package:yaha/hike/hike-card/hike-card.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/buttons/filter-button.dart';
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: YahaBackButton(),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Search results',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.medium,
                                  fontWeight: FontWeight.w600,
                                  color: YahaColors.textColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: YahaSpaceSizes.xSmall),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: FilterButton(),
                            ),
                          ),
                        ],
                      ),
                      /*Container(
                          //height: MediaQuery.of(context).size.height,
                          height: 800,
                          child: HikeCardList(),
                        ),*/
                      Padding(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.xLarge,
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
