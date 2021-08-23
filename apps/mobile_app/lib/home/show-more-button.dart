import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';

class ShowMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 135,
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Show more',
                  style: TextStyle(
                      fontSize: YahaFontSizes.small,
                      fontWeight: FontWeight.w500,
                      color: YahaColors.textColor),
                ),
                Icon(
                  Icons.chevron_right,
                  size: YahaFontSizes.xxLarge,
                  color: YahaColors.textColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
