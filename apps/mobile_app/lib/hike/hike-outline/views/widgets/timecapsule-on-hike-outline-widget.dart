import 'package:flutter/material.dart';
import 'package:yaha/profile/time-capsules/views/widgets/poi-with-image-widget.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:yaha/views/hike-outline/screens/time-capsule-info-screen.dart';

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
          PoiWithImageWidget(
            backgroundColor: YahaColors.timeCapsule,
            image: 'assets/images/timecapsule.png',
            radius: 19,
            padding: YahaSpaceSizes.xSmall,
          ),
          Container(
            padding: EdgeInsets.only(left: YahaSpaceSizes.small),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TimeCapsuleInfoScreen()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: YahaFontSizes.small,
                      color: YahaColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: YahaSpaceSizes.xSmall),
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
