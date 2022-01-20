import 'package:flutter/material.dart';

class PoiWithImageWidget extends StatelessWidget {
  final Color backgroundColor;
  final String image;
  final double radius;
  final double padding;

  const PoiWithImageWidget({
    Key? key,
    required this.backgroundColor,
    required this.image,
    required this.radius,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Container(
        padding: EdgeInsets.all(padding),
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
