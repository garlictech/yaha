import 'package:flutter/material.dart';
import 'package:yaha/hike/hike-outline/checkpoint-poi-list-preview.dart';
import 'package:yaha/hike/hike-outline/more-poi.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

import 'poi.dart';

// We have to move these classes somewhere else
class CheckpointModel {
  final String title;
  final Color boxBackgorundColor;
  final Color backgroundColor;
  final IconData icon;
  final double iconSize;
  final String estimatedArrival;
  final double padding;

  const CheckpointModel({
    required this.title,
    required this.boxBackgorundColor,
    required this.backgroundColor,
    required this.icon,
    required this.iconSize,
    required this.estimatedArrival,
    required this.padding,
  });
}

class Checkpoint extends StatelessWidget {
  final CheckpointModel checkpointModel;

  const Checkpoint({Key? key, required this.checkpointModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(YahaBorderRadius.general),
      child: Container(
        padding: EdgeInsets.all(YahaSpaceSizes.small),
        constraints: BoxConstraints(
          maxWidth: YahaBoxSizes.checkpointWidthMax,
        ),
        height: YahaBoxSizes.checkpointHeight,
        color: checkpointModel.boxBackgorundColor.withOpacity(0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Poi(
              backgroundColor: checkpointModel.backgroundColor,
              icon: checkpointModel.icon,
              iconSize: checkpointModel.iconSize,
              padding: checkpointModel.padding,
            ),
            Container(
              padding: EdgeInsets.only(
                left: YahaSpaceSizes.general,
                right: YahaSpaceSizes.general,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: YahaSpaceSizes.xSmall),
                    constraints: BoxConstraints(maxWidth: 180.0),
                    child: Text(
                      checkpointModel.title,
                      style: TextStyle(
                        fontSize: YahaFontSizes.medium,
                        fontWeight: FontWeight.w600,
                        color: YahaColors.textColor,
                      ),
                    ),
                  ),
                  CheckpointPoiListPreview(),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  checkpointModel.estimatedArrival,
                  style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MorePoi()));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: YahaIconSizes.medium,
                    color: YahaColors.textColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
