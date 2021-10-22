import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-image-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class ChallengeBox extends StatefulWidget {
  final String title;
  final String icon;

  const ChallengeBox({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  _ChallengeBoxState createState() => _ChallengeBoxState();
}

class _ChallengeBoxState extends State<ChallengeBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: YahaBoxSizes.widthGeneral,
      height: YahaBoxSizes.heightGeneral,
      decoration: BoxDecoration(
        border: Border.all(
          color: YahaColors.primary,
          width: YahaBorderWidth.medium,
        ),
        borderRadius: BorderRadius.circular(YahaBorderRadius.general),
      ),
      child: Container(
        padding: EdgeInsets.all(YahaSpaceSizes.general),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.icon,
              width: YahaImagesSizes.widthSmall,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: YahaColors.primary,
                fontSize: YahaFontSizes.xSmall,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
