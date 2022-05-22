import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class ChallengeBox extends StatefulWidget {
  final String title;
  final String icon;
  final Widget nextScreen;

  const ChallengeBox({
    Key? key,
    required this.title,
    required this.icon,
    required this.nextScreen,
  }) : super(key: key);

  @override
  _ChallengeBoxState createState() => _ChallengeBoxState();
}

class _ChallengeBoxState extends State<ChallengeBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => widget.nextScreen));
      },
      child: Container(
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
          padding: const EdgeInsets.all(YahaSpaceSizes.general),
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
                style: const TextStyle(
                  color: YahaColors.primary,
                  fontSize: YahaFontSizes.xSmall,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
