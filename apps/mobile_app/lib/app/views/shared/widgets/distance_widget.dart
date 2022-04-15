import 'package:flutter/material.dart';

class DistanceWidget extends StatelessWidget {
  final double distanceInMeters;
  final TextStyle? style;

  const DistanceWidget({Key? key, required this.distanceInMeters, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = distanceInMeters < 2000
        ? distanceInMeters.round()
        : (distanceInMeters * 10).round() / 10;
    return Text(value.toString(), style: style);
  }
}
