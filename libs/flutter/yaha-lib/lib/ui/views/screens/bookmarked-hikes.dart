import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';

class BookmarkedHikes extends ConsumerWidget {
  const BookmarkedHikes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: const Text(
          'Bookmarked hikes',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: YahaFontSizes.medium,
            color: YahaColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const YahaBackButton(),
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
                              backgroundImage: 'packages/flutter_yaha_lib/assets/images/budapest.png',
                            ),
                            HikeCard(
                              title: 'Tura',
                              subTitle: 'Túrázás, vár, erdő, és barlang',
                              backgroundImage: 'packages/flutter_yaha_lib/assets/images/tura.png',
                            ),
                            HikeCard(
                              title: 'Mátra',
                              subTitle: 'Mátra, erdős hegyek túrázáshoz',
                              backgroundImage: 'packages/flutter_yaha_lib/assets/images/matra.png',
                            ),
                            HikeCard(
                              title: 'Balaton',
                              subTitle: 'Nagy édesvizű tó üdülővárosokkal',
                              backgroundImage: 'packages/flutter_yaha_lib/assets/images/balaton.png',
                            ),
                            HikeCard(
                              title: 'Budapest',
                              subTitle: 'Várhegy, Duna, Lánchid',
                              backgroundImage: 'packages/flutter_yaha_lib/assets/images/budapest.png',
                            ),
                            HikeCard(
                              title: 'Balaton',
                              subTitle: 'Nagy édesvizű tó üdülővárosokkal',
                              backgroundImage: 'packages/flutter_yaha_lib/assets/images/balaton.png',
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
