import 'package:flutter/material.dart';
import 'package:yaha/app/views/achievements/market/widgets/time-capsule-box-widget.dart';
import 'package:yaha/app/views/shared/shared.dart';

class AHomeScreen extends StatelessWidget {
  const AHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: YahaSpaceSizes.general,
                        right: YahaSpaceSizes.general),
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: YahaBoxSizes.heightXXSmall,
                                    width: YahaBoxSizes.widthXXSmall,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          YahaBorderRadius.small),
                                      child: Image.asset(
                                          'assets/images/profile-authenticated.png'),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: YahaSpaceSizes.medium),
                                    child: const Text(
                                      'Hello John!',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.medium,
                                          fontWeight: FontWeight.w600,
                                          color: YahaColors.textColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                iconSize: YahaFontSizes.xxLarge,
                                color: YahaColors.textColor,
                                icon: const Icon(Icons.notifications_outlined),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        //MAP COMES HERE
                        /*Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general,
                              bottom: YahaSpaceSizes.general),
                          child: UnconstrainedBox(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.large),
                              height: 340,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),*/
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general,
                              bottom: YahaSpaceSizes.medium),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'TimeCapsules',
                            style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimeCapsuleBoxWidget(),
                            TimeCapsuleBoxWidget(),
                          ],
                        )
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
