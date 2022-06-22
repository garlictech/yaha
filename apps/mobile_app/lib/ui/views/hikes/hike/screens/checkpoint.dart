import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import 'checkpoint-poi-list-preview.dart';

// We have to move these classes somewhere else
class CheckpointModel {
  final String title;
  final Color boxBackgorundColor;
  final Color backgroundColor;
  final IconData icon;
  final double iconSize;
  final String estimatedArrival;
  final double padding;
  final double radius;

  const CheckpointModel({
    required this.title,
    required this.boxBackgorundColor,
    required this.backgroundColor,
    required this.icon,
    required this.iconSize,
    required this.estimatedArrival,
    required this.padding,
    required this.radius,
  });
}

class Checkpoint extends StatelessWidget {
  final CheckpointModel checkpointModel;

  const Checkpoint({Key? key, required this.checkpointModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /*onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MorePoiScreen()));
      },*/
      child: ClipRRect(
        borderRadius: BorderRadius.circular(YahaBorderRadius.general),
        child: Container(
          padding: const EdgeInsets.all(YahaSpaceSizes.small),
          constraints: const BoxConstraints(
            maxWidth: YahaBoxSizes.checkpointWidthMax,
          ),
          height: YahaBoxSizes.checkpointHeight,
          color: checkpointModel.boxBackgorundColor.withOpacity(0.2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /*PoiSummary(
                    backgroundColor: checkpointModel.backgroundColor,
                    icon: checkpointModel.icon,
                    iconSize: checkpointModel.iconSize,
                    padding: checkpointModel.padding,
                    radius: checkpointModel.radius,
                  ),
                  */
                  Container(
                    padding: const EdgeInsets.only(
                      left: YahaSpaceSizes.general,
                      right: YahaSpaceSizes.general,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.xSmall),
                          constraints: const BoxConstraints(maxWidth: 180.0),
                          child: Text(
                            checkpointModel.title,
                            style: const TextStyle(
                              fontSize: YahaFontSizes.medium,
                              fontWeight: FontWeight.w600,
                              color: YahaColors.textColor,
                            ),
                          ),
                        ),
                        const CheckpointPoiListPreview(),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: YahaSpaceSizes.xxSmall, right: YahaSpaceSizes.xxSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      checkpointModel.estimatedArrival,
                      style: const TextStyle(
                        fontSize: YahaFontSizes.small,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: YahaSpaceSizes.small),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: YahaIconSizes.medium,
                        color: YahaColors.textColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
