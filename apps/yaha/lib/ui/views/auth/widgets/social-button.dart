import 'package:flutter/material.dart';

import '../../shared/widgets/yaha-border-radius.dart';
import '../../shared/widgets/yaha-box-sizes.dart';
import '../../shared/widgets/yaha-font-sizes.dart';

class SocialButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final String iconPath;
  final Color buttonColor;
  final double iconSize;
  final double leftPadding;

  const SocialButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.iconPath,
      required this.buttonColor,
      required this.iconSize,
      required this.leftPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: YahaBoxSizes.buttonHeight,
      width: YahaBoxSizes.buttonWidthBig,
      child: ElevatedButton(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: leftPadding),
                child: Image.asset(
                  iconPath,
                  height: iconSize,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: YahaFontSizes.small,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        onPressed: () => onPressed.call(),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(YahaBorderRadius.general))),
        ),
      ),
    );
  }
}
