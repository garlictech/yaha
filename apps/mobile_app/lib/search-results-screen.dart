import 'package:flutter/material.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/buttons/filter-button.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: const Text(
          'Search results',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: YahaFontSizes.medium,
            color: YahaColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: YahaBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: YahaSpaceSizes.xSmall),
            child: FilterButton(),
          )
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Column(
                    children: [
                      /*Container(
                          //height: MediaQuery.of(context).size.height,
                          height: 800,
                          child: HikeCardList(),
                        ),*/
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
                          children: const [
                            /*HikeCard(
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
                            ),*/
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
