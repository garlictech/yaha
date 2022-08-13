import 'package:flutter/material.dart';
import 'package:yaha/ui/views/shared/shared.dart';

class YahaBackButton extends StatelessWidget {
  final Color color;
  final bool withBackgroundBlur;

  const YahaBackButton(
      {this.color = YahaColors.textColor,
      this.withBackgroundBlur = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(withBackgroundBlur ? 0.4 : 0),
            shape: BoxShape.circle),
        margin: const EdgeInsets.all(YahaSpaceSizes.xSmall),
        child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_rounded,
            size: YahaIconSizes.medium,
            color: color,
          ),
        ));
  }
}
