import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/gallery.dart';
import 'package:yaha/hike/hike-outline/poi.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:yaha/views/comments/screens/comments-screen.dart';

class PoiScreen extends ConsumerWidget {
  /*final int openingHoursChevronQuarterTurns;

  const PoiScreen({
    Key? key,
    required this.openingHoursChevronQuarterTurns,
  }) : super(key: key);*/

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: Text(
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
              icon: Icon(Icons.comment_outlined,
                  size: YahaIconSizes.medium, color: YahaColors.textColor),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CommentsScreen()));
              },
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
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
                            child: Poi(
                              backgroundColor: YahaColors.generic,
                              icon: Icons.museum_rounded,
                              iconSize: 48,
                              padding: YahaSpaceSizes.small,
                              radius: 40,
                            )),
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general),
                          child: Text(
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
                                  child: Icon(Icons.schedule_outlined)),
                              Text('Open',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w400,
                                      color: YahaColors.primary)),
                              Text(' - closing: 18:00',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w400,
                                      color: YahaColors.textColor)),
                              RotatedBox(
                                quarterTurns: 0,
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Icon(Icons.expand_more)),
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
                                  child: Icon(Icons.location_on_outlined)),
                              Text('Opening hours',
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
                                  child: Icon(Icons.call)),
                              Text('(06 1) 338 2122',
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w400,
                                      color: YahaColors.textColor)),
                            ],
                          ),
                        ),
                        Container(
                            height: 220.0,
                            width: MediaQuery.of(context).size.width,
                            child: Gallery()),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xLarge,
                              bottom: YahaSpaceSizes.general),
                          child: SizedBox(
                            height: YahaBoxSizes.buttonHeight,
                            width: YahaBoxSizes.buttonWidthBig,
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.add,
                                color: YahaColors.accentColor,
                                size: YahaFontSizes.large,
                              ),
                              onPressed: () {},
                              label: Text('Add to hike',
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
