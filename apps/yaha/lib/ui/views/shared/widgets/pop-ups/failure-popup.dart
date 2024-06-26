import 'package:flutter/material.dart';

import '../../shared.dart';

class FailurePopup extends StatelessWidget {
  final String title;
  final String content;
  final String buttonTitle;

  const FailurePopup({
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
      title: const Icon(
        Icons.highlight_off_rounded,
        color: YahaColors.error,
        size: YahaIconSizes.xxxLarge,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: YahaFontSizes.medium,
                fontWeight: FontWeight.w500,
                color: YahaColors.textColor),
          ),
          Container(
            constraints:
                const BoxConstraints(maxWidth: YahaBoxSizes.widthMedium),
            padding: const EdgeInsets.only(top: YahaSpaceSizes.xSmall),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: YahaFontSizes.small,
                  fontWeight: FontWeight.w400,
                  color: YahaColors.textColor),
            ),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.only(
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
                style: const TextStyle(
                    fontSize: YahaFontSizes.small,
                    fontWeight: FontWeight.w500,
                    color: YahaColors.background),
              ),
              style: ElevatedButton.styleFrom(
                primary: YahaColors.error,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(YahaBorderRadius.general))),
              ),
            ),
          ),
        ),
      ],
      actionsPadding:
          const EdgeInsets.only(top: 0, bottom: YahaSpaceSizes.general),
      buttonPadding: EdgeInsets.zero,
    );
  }
}
