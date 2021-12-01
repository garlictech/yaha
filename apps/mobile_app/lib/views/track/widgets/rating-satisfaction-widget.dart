import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class RatingSatisfactionWidget extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;

  const RatingSatisfactionWidget({
    Key? key,
    required this.icon,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(YahaBorderRadius.semiSmall),
        child: Container(
          padding: EdgeInsets.all(YahaSpaceSizes.xxSmall),
          color: backgroundColor,
          child: Icon(
            icon,
            size: YahaIconSizes.ratingIcon,
            color: YahaColors.background,
          ),
        ),
      ),
    );
  }
}
