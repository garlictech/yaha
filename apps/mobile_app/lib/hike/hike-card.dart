import 'package:flutter/material.dart';
import 'package:yaha/yaha-border-radius.dart';

class HikeCard extends StatelessWidget {
  const HikeCard({Key? key, Color? color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(YahaBorderRadius.poiSmall),
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
