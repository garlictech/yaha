import 'package:flutter/material.dart';
import 'package:yaha/yaha-border-radius.dart';

class HikeCard extends StatelessWidget {
  final Color color;
  final String title;
  const HikeCard({Key? key, required this.color, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(YahaBorderRadius.poiSmall),
        child: Container(
          color: color,
          child: Align(
            alignment: Alignment.center,
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
