import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/hikes/events/screens/event-prize-screen.dart';
import 'package:yaha/ui/views/shared/shared.dart';

class ChallengeDetailScreen extends ConsumerWidget {
  const ChallengeDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
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
                          children: const [
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
                          padding: const EdgeInsets.all(YahaSpaceSizes.general),
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
                        child: const Text(
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
                          child: const Text(
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: YahaColors.primary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          YahaBorderRadius.general))),
                            ),
                            child: const Text(
                              'Apply',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w600),
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
