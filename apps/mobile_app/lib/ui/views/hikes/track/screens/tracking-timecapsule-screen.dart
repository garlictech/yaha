import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/ui/views/time-capsules/widgets/poi-with-image-widget.dart';

import '../../../shared/shared.dart';
import 'leave-a-timecapsule-screen.dart';

class TrackingTimeCapsuleScreen extends ConsumerWidget {
  final int collectedTimeCapsules;

  const TrackingTimeCapsuleScreen({
    Key? key,
    required this.collectedTimeCapsules,
  }) : super(key: key);

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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: YahaSpaceSizes.general,
                        right: YahaSpaceSizes.general,
                        top: YahaSpaceSizes.general),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            Icons.tungsten_rounded,
                            size: YahaIconSizes.large,
                            color: YahaColors.primary,
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(bottom: YahaSpaceSizes.xSmall),
                          child: Text(
                            'Leave a message for the future',
                            style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor),
                          ),
                        ),
                        const Text(
                          'You can leave a TimCapsule containing a message at your current location. Other hikers will only be able to open it at the same location. Be mindful about the message because once you placed the TimeCapsule you can’t delete it.',
                          style: TextStyle(
                              fontSize: YahaFontSizes.small,
                              fontWeight: FontWeight.w400,
                              color: YahaColors.textColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xLarge,
                              bottom: YahaSpaceSizes.xSmall),
                          child: Text(
                            'Collected TimeCapsules: ' +
                                collectedTimeCapsules.toString(),
                            style: const TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor),
                          ),
                        ),
                        Wrap(
                          spacing: YahaSpaceSizes.small,
                          direction: Axis.horizontal,
                          runSpacing: YahaSpaceSizes.small,
                          children: const [
                            PoiWithImageWidget(
                                backgroundColor: YahaColors.timeCapsule,
                                image: 'assets/images/timecapsule.png',
                                radius: 19,
                                padding: YahaSpaceSizes.xSmall),
                            PoiWithImageWidget(
                                backgroundColor: YahaColors.timeCapsule,
                                image: 'assets/images/timecapsule.png',
                                radius: 19,
                                padding: YahaSpaceSizes.xSmall),
                            PoiWithImageWidget(
                                backgroundColor: YahaColors.timeCapsule,
                                image: 'assets/images/timecapsule.png',
                                radius: 19,
                                padding: YahaSpaceSizes.xSmall),
                            PoiWithImageWidget(
                                backgroundColor: YahaColors.timeCapsule,
                                image: 'assets/images/timecapsule.png',
                                radius: 19,
                                padding: YahaSpaceSizes.xSmall)
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.xxLarge),
                          child: SizedBox(
                            height: YahaBoxSizes.buttonHeight,
                            width: YahaBoxSizes.buttonWidthBig,
                            child: ElevatedButton(
                              /*icon: Image.asset(
                                'assets/images/timecapsule.png',
                                width: YahaIconSizes.large,
                              ),*/
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LeaveATimeCapsuleScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Leave a TimeCapsule',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.textColor),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: YahaColors.timeCapsule,
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
          ),
        ],
      ),
    );
  }
}
