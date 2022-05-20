import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../../time-capsules/widgets/poi-with-image-widget.dart';
import '../../hike-outline/screens/time-capsule-info-screen.dart';

class TimeCapsuleOnHikeOutlineScreen extends StatelessWidget {
  final String text;

  const TimeCapsuleOnHikeOutlineScreen({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: YahaSpaceSizes.xSmall, bottom: YahaSpaceSizes.xSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PoiWithImageWidget(
            backgroundColor: YahaColors.timeCapsule,
            image: 'assets/images/timecapsule.png',
            radius: 19,
            padding: YahaSpaceSizes.xSmall,
          ),
          Container(
            padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TimeCapsuleInfoScreen()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: YahaFontSizes.small,
                      color: YahaColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: YahaSpaceSizes.xSmall),
                    child: Text(
                      'What is a TimeCapsule?',
                      style: TextStyle(
                        fontSize: YahaFontSizes.xSmall,
                        color: YahaColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
