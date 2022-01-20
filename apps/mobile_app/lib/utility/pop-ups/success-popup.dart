import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class SuccessPopup extends StatelessWidget {
  final String title;
  final String content;
  final String buttonTitle;

  const SuccessPopup({
    Key? key,
    required this.title,
    required this.content,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: YahaColors.background,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(YahaBorderRadius.general)),
      title: Icon(
        Icons.task_alt_rounded,
        color: YahaColors.primary,
        size: YahaIconSizes.xxxLarge,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w500,
                color: YahaColors.textColor),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: YahaBoxSizes.widthMedium),
            padding: EdgeInsets.only(top: YahaSpaceSizes.xSmall),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: YahaFontSizes.small,
                  fontWeight: FontWeight.w400,
                  color: YahaColors.textColor),
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.only(
          bottom: YahaSpaceSizes.general,
          top: YahaSpaceSizes.medium,
          left: YahaSpaceSizes.general,
          right: YahaSpaceSizes.general),
      actions: [
        Center(
          child: SizedBox(
            width: YahaBoxSizes.buttonWidthSmall,
            height: YahaBoxSizes.buttonHeight,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                buttonTitle,
                style: TextStyle(
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w500,
                    color: YahaColors.background),
              ),
              style: ElevatedButton.styleFrom(
                primary: YahaColors.primary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(YahaBorderRadius.general))),
              ),
            ),
          ),
        ),
      ],
      actionsPadding: EdgeInsets.only(top: 0, bottom: YahaSpaceSizes.general),
      buttonPadding: EdgeInsets.zero,
    );
  }
}
