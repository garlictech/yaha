import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../comments/screens/commments-screen.dart';
import '../../shared/widgets/buttons/back-button.dart';
import '../../shared/widgets/gallery-widget.dart';
import '../../shared/widgets/yaha-border-radius.dart';
import '../../shared/widgets/yaha-box-sizes.dart';
import '../../shared/widgets/yaha-colors.dart';
import '../../shared/widgets/yaha-font-sizes.dart';
import '../../shared/widgets/yaha-icon-sizes.dart';
import '../../shared/widgets/yaha-space-sizes.dart';
import 'poi-summary.dart';

class PoiScreen extends ConsumerWidget {
  const PoiScreen({Key? key}) : super(key: key);

  /*final int openingHoursChevronQuarterTurns;

  const PoiScreen({
    Key? key,
    required this.openingHoursChevronQuarterTurns,
  }) : super(key: key);*/

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: const Text(
          'Hungarian\nNational Museum',
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
            padding: const EdgeInsets.only(right: YahaSpaceSizes.medium),
            child: IconButton(
              icon: const Icon(Icons.comment_outlined,
                  size: YahaIconSizes.medium, color: YahaColors.textColor),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CommmentsScreen()));
              },
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: YahaSpaceSizes.general,
                        right: YahaSpaceSizes.general),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.general,
                                bottom: YahaSpaceSizes.general),
                            child: const PoiSummary(
                              backgroundColor: YahaColors.generic,
                              icon: Icons.museum_rounded,
                              iconSize: 48,
                              padding: YahaSpaceSizes.small,
                              radius: 40,
                            )),
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general),
                          child: const Text(
                              'The Hungarian National Museum (Hungarian: Magyar Nemzeti Múzeum) was founded in 1802 and is the national museum for the history, art, and archaeology of Hungary.',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w400,
                                  color: YahaColors.textColor)),
                        ),
                        Container(
                          height: 340,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(YahaBorderRadius.general),
                            child: Image.asset(
                              'assets/images/poi_page.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.medium),
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                      right: YahaSpaceSizes.small),
                                  child: const Icon(Icons.schedule_outlined)),
                              const Text('Open',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w400,
                                      color: YahaColors.primary)),
                              const Text(' - closing: 18:00',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w400,
                                      color: YahaColors.textColor)),
                              RotatedBox(
                                quarterTurns: 0,
                                child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(Icons.expand_more)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.medium),
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                      right: YahaSpaceSizes.small),
                                  child:
                                      const Icon(Icons.location_on_outlined)),
                              const Text('Opening hours',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w400,
                                      color: YahaColors.textColor)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general),
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(
                                      right: YahaSpaceSizes.small),
                                  child: const Icon(Icons.call)),
                              const Text('(06 1) 338 2122',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w400,
                                      color: YahaColors.textColor)),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 220.0,
                            width: MediaQuery.of(context).size.width,
                            child: const GalleryWidget()),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xLarge,
                              bottom: YahaSpaceSizes.general),
                          child: SizedBox(
                            height: YahaBoxSizes.buttonHeight,
                            width: YahaBoxSizes.buttonWidthBig,
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.add,
                                color: YahaColors.accentColor,
                                size: YahaFontSizes.large,
                              ),
                              onPressed: () {},
                              label: const Text('Add to hike',
                                  style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                  )),
                              style: ElevatedButton.styleFrom(
                                primary: YahaColors.primary,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            YahaBorderRadius.general))),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
