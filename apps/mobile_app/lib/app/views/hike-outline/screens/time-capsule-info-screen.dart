import 'package:flutter/material.dart';

import '../../shared/widgets/buttons/back-button.dart';
import '../../shared/widgets/yaha-colors.dart';
import '../../shared/widgets/yaha-font-sizes.dart';
import '../../shared/widgets/yaha-space-sizes.dart';
import '../../time-capsules/widgets/poi-with-image-widget.dart';

class TimeCapsuleInfoScreen extends StatelessWidget {
  const TimeCapsuleInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YahaColors.timeCapsuleBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'TimeCapsule',
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
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: YahaSpaceSizes.general,
                        right: YahaSpaceSizes.general),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.small,
                              bottom: YahaSpaceSizes.general),
                          child: const PoiWithImageWidget(
                            backgroundColor: YahaColors.timeCapsule,
                            image: 'assets/images/timecapsule.png',
                            radius: 40,
                            padding: YahaSpaceSizes.small,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'What is a TimeCapsule?',
                                style: TextStyle(
                                    color: YahaColors.textColor,
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: YahaSpaceSizes.xSmall,
                                    bottom: YahaSpaceSizes.general),
                                child: Text(
                                  'A TimeCapsule is the digital version of a real time capsule. You can leave a message or some pictures for the future in it.',
                                  style: TextStyle(
                                      color: YahaColors.textColor,
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Text(
                                'How does it work?',
                                style: TextStyle(
                                    color: YahaColors.textColor,
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: YahaSpaceSizes.xSmall,
                                    bottom: YahaSpaceSizes.general),
                                child: Text(
                                  'You can place a TimeCapsule during your hike at the exact coordinates where you are at the time you place it.\nOther hikers can only open your TimeCapsule and see its content if they’re exactly at the same coordinates where you placed it. They can only see the content as long as they stay there.',
                                  style: TextStyle(
                                      color: YahaColors.textColor,
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Text(
                                'Can you delete a TimeCapsule after you placed it?',
                                style: TextStyle(
                                    color: YahaColors.textColor,
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: YahaSpaceSizes.xSmall,
                                    bottom: YahaSpaceSizes.general),
                                child: Text(
                                  'The short answer is no.',
                                  style: TextStyle(
                                      color: YahaColors.textColor,
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
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
