import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/hike/hike-screen/most-interesting-place-on-route/poi-list-tile-widget.dart';
import 'package:yaha/hike/views/widgets/list-section-title-box-widget.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class MorePoiScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: Text(
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
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: YahaSpaceSizes.small),
                    child: Column(
                      children: [
                        ListSectionTitleBox(
                          icon: Icons.museum,
                          title: 'Museum',
                          backgroundColor: YahaColors.generic,
                          titleColor: YahaColors.background,
                          iconVisibility: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
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
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.medium),
                          child: PoiListTileWidget(
                            poiColor: YahaColors.secondary,
                            poiIcon: Icons.outlined_flag_rounded,
                            title: 'Hungarian Parliament Building',
                            distanceFromStart: 500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
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
                          padding: const EdgeInsets.only(
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
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.small,
                              bottom: YahaSpaceSizes.small),
                          child: Divider(
                              color: YahaColors.divider,
                              thickness: YahaBorderWidth.xxSmall),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.medium),
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
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.medium),
                          child: PoiListTileWidget(
                            poiColor: YahaColors.amenity,
                            poiIcon: Icons.fastfood_rounded,
                            title: "McDonald's Nyugati",
                            distanceFromStart: 500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
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
