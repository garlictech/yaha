import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';

class ShowMoreButton extends StatelessWidget {
  final Widget nextScreen;
  const ShowMoreButton({Key? key, required this.nextScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => nextScreen));
            },
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
