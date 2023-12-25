import 'package:flutter/material.dart';
import 'package:flutter_yaha_lib/ui/views/shared/shared.dart';

class YahaProgressIndicator extends StatelessWidget {
  final String? text;
  final Color color;

  const YahaProgressIndicator(
      {this.text, this.color = YahaColors.textColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      if (text != null)
        Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(text!.toUpperCase(),
                style:
                    TextStyle(color: color, fontSize: YahaFontSizes.xxSmall))),
      CircularProgressIndicator(color: color)
    ]);
  }
}
