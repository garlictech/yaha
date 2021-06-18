import 'package:flutter/material.dart';
import 'package:mobile_app/yaha-border-radius.dart';
import 'package:mobile_app/yaha-colors.dart';
import 'package:mobile_app/yaha-font-sizes.dart';
import 'package:mobile_app/yaha-space-sizes.dart';

class EventDetailPage extends StatefulWidget {
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
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
                            left: YahaSpaceSizes.small,
                            right: YahaSpaceSizes.small),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 28.0,
                              color: YahaColors.textColor,
                            ),
                            Text('Eger Csillaga\n Teljesítménytúra',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: YahaFontSizes.large,
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.textColor)),
                            Container(
                              width: 32.0,
                              height: 0.0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.general,
                            bottom: YahaSpaceSizes.general),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 3.0,
                                color: YahaColors.primary,
                              ),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Image.asset(
                            'assets/images/EgerCsillaga.jpeg',
                            fit: BoxFit.cover,
                            height: 120.0,
                            width: 120.0,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.small,
                                left: YahaSpaceSizes.small),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.schedule_outlined,
                                  color: YahaColors.primary,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: YahaSpaceSizes.small),
                                  child: Text('Saturday, August 14, 2021',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.small,
                                left: YahaSpaceSizes.small),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: YahaColors.primary,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: YahaSpaceSizes.small),
                                  child: Text('Felsőtárkány, lakeside',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.general,
                                left: YahaSpaceSizes.small),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.attach_money_rounded,
                                  color: YahaColors.primary,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: YahaSpaceSizes.small),
                                  child: Text('20 USD',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small,
                                          fontWeight: FontWeight.w400,
                                          color: YahaColors.textColor)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.general,
                            left: YahaSpaceSizes.medium,
                            right: YahaSpaceSizes.medium),
                        child: Text(
                            'THE STAR OF EGER is a performance tour to be held in Bükk. On the performance tour, the given distances must be completed within the specified level time by touching the mandatory checkpoints one after the other.'),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.general),
                        child: Text(
                          'Prizes',
                          style: TextStyle(
                              fontSize: YahaFontSizes.medium,
                              fontWeight: FontWeight.w600,
                              color: YahaColors.textColor),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: YahaSpaceSizes.small,
                                right: YahaSpaceSizes.general),
                            child: Image.asset('assets/images/lynx-brooch.png',
                                fit: BoxFit.cover),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                right: YahaSpaceSizes.general),
                            child: Image.asset('assets/images/deer-brooch.png',
                                fit: BoxFit.cover),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                right: YahaSpaceSizes.general),
                            child: Image.asset(
                                'assets/images/flower-brooch.png',
                                fit: BoxFit.cover),
                          ),
                          Container(
                            child: Image.asset('assets/images/paw-brooch.png',
                                fit: BoxFit.cover),
                          ),
                        ],
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
