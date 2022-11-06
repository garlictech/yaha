import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String text;

  const InfoText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Padding(
          padding: EdgeInsets.only(right: 5), child: Icon(Icons.info_outline)),
      Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyText2))
    ]);
  }
}
