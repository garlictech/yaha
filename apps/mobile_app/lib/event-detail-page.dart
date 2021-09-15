import 'package:flutter/material.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

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
                            left: YahaSpaceSizes.general,
                            right: YahaSpaceSizes.general),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: YahaBackButton(),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text('Eger Csillaga\n Teljesítménytúra',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.large,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                            //Container(
                            //width: 32.0,
                            //height: 0.0,
                            //),
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
                                width: YahaBorderWidth.medium,
                                color: YahaColors.primary,
                              ),
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.general)),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(YahaBorderRadius.general),
                            child: Image.asset(
                              'assets/images/EgerCsillaga.jpeg',
                              fit: BoxFit.cover,
                              height: YahaBoxSizes.heightSmall,
                              width: YahaBoxSizes.widthSmall,
                              semanticLabel:
                                  "Eger Csillaga Teljesítménytúra logó",
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.small,
                                left: YahaSpaceSizes.general),
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
                                          color: YahaColors.textColor)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.small,
                                left: YahaSpaceSizes.general),
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
                                          color: YahaColors.textColor)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.general,
                                left: YahaSpaceSizes.general),
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
                            left: YahaSpaceSizes.general,
                            right: YahaSpaceSizes.general),
                        child: Text(
                          'THE STAR OF EGER is a performance tour to be held in Bükk. On the performance tour, the given distances must be completed within the specified level time by touching the mandatory checkpoints one after the other.',
                          style: TextStyle(fontSize: YahaFontSizes.small),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general,
                              left: YahaSpaceSizes.general),
                          child: Text(
                            'Prizes',
                            style: TextStyle(
                                fontSize: YahaFontSizes.medium,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: YahaSpaceSizes.general,
                                right: YahaSpaceSizes.general),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: YahaBorderWidth.small,
                                    color: YahaColors.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      YahaBorderRadius.xSmall)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.xSmall),
                                child: Image.asset(
                                    'assets/images/lynx-brooch.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                right: YahaSpaceSizes.general),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: YahaBorderWidth.small,
                                    color: YahaColors.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      YahaBorderRadius.xSmall)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.xSmall),
                                child: Image.asset(
                                    'assets/images/deer-brooch.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                right: YahaSpaceSizes.general),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: YahaBorderWidth.small,
                                    color: YahaColors.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      YahaBorderRadius.xSmall)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.xSmall),
                                child: Image.asset(
                                    'assets/images/flower-brooch.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: YahaBorderWidth.small,
                                  color: YahaColors.primary,
                                ),
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.xSmall)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.xSmall),
                              child: Image.asset('assets/images/paw-brooch.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: YahaSpaceSizes.large),
                        child: SizedBox(
                          width: 300.0,
                          height: 50.0,
                          child: ElevatedButton(
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {},
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
