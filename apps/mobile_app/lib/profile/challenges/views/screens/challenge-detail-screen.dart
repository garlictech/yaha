import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/profile/events/views/screens/event-prize-screen.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class ChallengeDetailScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,  WidgetRef ref) {
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
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: YahaBackButton(),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text('Walk 50km challenge',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.general,
                            bottom: YahaSpaceSizes.large),
                        child: Container(
                          padding: EdgeInsets.all(YahaSpaceSizes.general),
                          width: YahaBoxSizes.widthSmall,
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
                                'assets/images/hiking_person.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.general,
                            left: YahaSpaceSizes.general,
                            right: YahaSpaceSizes.general),
                        child: Text(
                          'By completing the 50 km challenge you will gain physical fitness, mental well-being, make new friends, explore new places, and connect with family, friends and yourself through nature.',
                          style: TextStyle(fontSize: YahaFontSizes.small),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.small,
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EventPrizeScreen()));
                            },
                            child: Container(
                              height: YahaBoxSizes.heightXXXSmall,
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
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EventPrizeScreen()));
                            },
                            child: Container(
                              height: YahaBoxSizes.heightXXXSmall,
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
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EventPrizeScreen()));
                            },
                            child: Container(
                              height: YahaBoxSizes.heightXXXSmall,
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
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EventPrizeScreen()));
                            },
                            child: Container(
                              height: YahaBoxSizes.heightXXXSmall,
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
                                    'assets/images/adventurers-paw.png',
                                    fit: BoxFit.cover),
                              ),
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
