import 'package:flutter/material.dart';

class YahaSectionTitle extends StatelessWidget {
  final String text;

  const YahaSectionTitle({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(text.toUpperCase(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headline2));
  }
}
