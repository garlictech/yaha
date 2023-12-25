import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../screens/timecapsule-details-screen.dart';
import 'poi-with-image-widget.dart';

class TimeCapsuleListTileWidget extends StatelessWidget {
  final String date;
  final String secondLine;
  final bool whoPlacedItVisibility;
  final bool contentVisibility;

  const TimeCapsuleListTileWidget({
    Key? key,
    required this.date,
    required this.secondLine,
    required this.whoPlacedItVisibility,
    required this.contentVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TimeCapsuleDetailsScreen(
              whoPlacedItVisibility: whoPlacedItVisibility,
              contentVisibility: contentVisibility,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
            left: YahaSpaceSizes.general, right: YahaSpaceSizes.general),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const PoiWithImageWidget(
                  backgroundColor: YahaColors.timeCapsule,
                  image:
                      'packages/flutter_yaha_lib/assets/images/timecapsule.png',
                  radius: 19,
                  padding: YahaSpaceSizes.xSmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: YahaSpaceSizes.small),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: YahaSpaceSizes.xSmall),
                        child: Text(
                          'TimeCapsule',
                          style: TextStyle(
                            fontSize: YahaFontSizes.small,
                            color: YahaColors.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        /*'${secondLine}: ${date}',*/
                        secondLine + ': ' + date,
                        style: const TextStyle(
                          fontSize: YahaFontSizes.small,
                          color: YahaColors.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: YahaIconSizes.medium,
              color: YahaColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
