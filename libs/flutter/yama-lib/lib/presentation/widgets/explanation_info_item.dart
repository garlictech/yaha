import 'package:flutter/material.dart';
import 'package:yama_lib/presentation/theme.dart';

class ExplanationInfoItem extends StatelessWidget {
  final int index;
  final String body;
  final Color textColor;

  const ExplanationInfoItem(
      {super.key,
      required this.index,
      required this.body,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    final widget1 = Container(
        decoration: BoxDecoration(
            color: primaryColor[index * 100], shape: BoxShape.circle),
        width: 50,
        height: 50,
        child: Center(
            child: Text(index.toString(),
                style: const TextStyle(fontSize: 40, color: Colors.white))));

    final widget2 = Expanded(
        child: Text(body, style: TextStyle(color: textColor, fontSize: 12)));

    final isOdd = index % 2 != 0;

    List<Widget> items;

    if (isOdd) {
      items = [widget1, const SizedBox(width: 20), widget2];
    } else {
      items = [widget2, const SizedBox(width: 20), widget1];
    }

    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(children: [
          Row(children: items),
          const Divider(color: Colors.white)
        ]));
  }
}
