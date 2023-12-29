import 'package:flutter/material.dart';

import '../shared.dart';

class SuccessPopup extends StatelessWidget {
  final String title;
  final String content;
  final String buttonTitle;

  const SuccessPopup({
    super.key,
    required this.title,
    required this.content,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: YahaColors.background,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(YahaBorderRadius.general)),
      title: const Icon(
        Icons.task_alt_rounded,
        size: YahaIconSizes.xxxLarge,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
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
              onPressed: () => Navigator.pop(context, 'OK'),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(YahaBorderRadius.general))),
              ),
              child: Text(
                buttonTitle,
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
