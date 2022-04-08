import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/shared.dart';
import '../widgets/list-section-title-box-widget.dart';
import 'poi-list-tile-widget.dart';

class MorePoiScreen extends ConsumerWidget {
  const MorePoiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: const Text(
          'Things on route',
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
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: YahaSpaceSizes.small),
                    child: Column(
                      children: const [
                        ListSectionTitleBox(
                          icon: Icons.museum,
                          title: 'Museum',
                          backgroundColor: YahaColors.generic,
                          titleColor: YahaColors.background,
                          iconVisibility: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: YahaSpaceSizes.medium,
                              bottom: YahaSpaceSizes.medium),
                          child: PoiListTileWidget(
                            poiColor: YahaColors.generic,
                            poiIcon: Icons.museum,
                            title: 'Hungarian National Museum',
                            distanceFromStart: 1300,
                          ),
                        ),
                        ListSectionTitleBox(
                          icon: Icons.location_city_rounded,
                          title: 'Sights',
                          backgroundColor: YahaColors.generic,
                          titleColor: YahaColors.background,
                          iconVisibility: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: YahaSpaceSizes.medium),
                          child: PoiListTileWidget(
                            poiColor: YahaColors.secondary,
                            poiIcon: Icons.outlined_flag_rounded,
                            title: 'Hungarian Parliament Building',
                            distanceFromStart: 500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: YahaSpaceSizes.small,
                              bottom: YahaSpaceSizes.small),
                          child: Divider(
                              color: YahaColors.divider,
                              thickness: YahaBorderWidth.xxSmall),
                        ),
                        PoiListTileWidget(
                          poiColor: YahaColors.generic,
                          poiIcon: Icons.location_city_rounded,
                          title: 'Buda Castle & Castle Hill',
                          distanceFromStart: 1700,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: YahaSpaceSizes.small,
                              bottom: YahaSpaceSizes.small),
                          child: Divider(
                              color: YahaColors.divider,
                              thickness: YahaBorderWidth.xxSmall),
                        ),
                        PoiListTileWidget(
                          poiColor: YahaColors.generic,
                          poiIcon: Icons.location_city_rounded,
                          title: "St. Stephen's Basilica",
                          distanceFromStart: 1900,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: YahaSpaceSizes.small,
                              bottom: YahaSpaceSizes.small),
                          child: Divider(
                              color: YahaColors.divider,
                              thickness: YahaBorderWidth.xxSmall),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: YahaSpaceSizes.medium),
                          child: PoiListTileWidget(
                            poiColor: YahaColors.generic,
                            poiIcon: Icons.location_city_rounded,
                            title: "Fisherman's Bastion",
                            distanceFromStart: 2500,
                          ),
                        ),
                        ListSectionTitleBox(
                          icon: Icons.fastfood_rounded,
                          title: 'Food',
                          backgroundColor: YahaColors.amenity,
                          titleColor: YahaColors.background,
                          iconVisibility: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: YahaSpaceSizes.medium),
                          child: PoiListTileWidget(
                            poiColor: YahaColors.amenity,
                            poiIcon: Icons.fastfood_rounded,
                            title: "McDonald's Nyugati",
                            distanceFromStart: 500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: YahaSpaceSizes.small,
                              bottom: YahaSpaceSizes.small),
                          child: Divider(
                              color: YahaColors.divider,
                              thickness: YahaBorderWidth.xxSmall),
                        ),
                        PoiListTileWidget(
                          poiColor: YahaColors.amenity,
                          poiIcon: Icons.fastfood_rounded,
                          title: "Burger King",
                          distanceFromStart: 1000,
                        ),
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
