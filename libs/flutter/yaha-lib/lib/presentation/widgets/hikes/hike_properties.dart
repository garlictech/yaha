import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/domain.dart';
import 'package:flutter_yaha_lib/providers/providers.dart';

import '../shared/shared.dart';
import 'hike_data_element.dart';

class HikeProperties extends ConsumerWidget {
  final HikeEntity hike;
  final double averageSpeedKmh;

  const HikeProperties(
      {required this.hike, required this.averageSpeedKmh, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: YahaSpaceSizes.medium,
      mainAxisSpacing: YahaSpaceSizes.medium,
      crossAxisCount: 3,
      children: <Widget>[
        HikeDataElement(
            title: "Distance",
            icon: Icons.hiking_rounded,
            value: _distanceValue(hike.trailLength)),
        HikeDataElement(
            title: "Uphill",
            icon: Icons.trending_up_rounded,
            value: _distanceValue(hike.uphill)),
        HikeDataElement(
            title: "Downhill",
            icon: Icons.trending_down_rounded,
            value: _distanceValue(hike.downhill)),
        HikeDataElement(
            title: "Time",
            icon: Icons.watch_later_rounded,
            value: _timeValue(ref.read(gameRulesServiceProvider).estimatedTime(
                hike.trailLength, hike.uphill, averageSpeedKmh))),
        HikeDataElement(
            title: "Score",
            icon: Icons.emoji_events_rounded,
            value: hike.score.toString()),
        HikeDataElement(
            icon: Icons.stars_rounded,
            value: _difficulty[1],
            color: _difficulty[0])
      ],
    );
  }

  _distanceValue(double distanceInMeters) {
    final value = distanceInMeters < 2000
        ? distanceInMeters.round()
        : (distanceInMeters / 100).round() / 10;

    final unit = distanceInMeters < 2000 ? 'm' : 'km';
    return '$value $unit';
  }

  _timeValue(double timeInMinutes) {
    final hours = timeInMinutes ~/ 60;
    final minutes = timeInMinutes.remainder(60).floor();

    String hoursTxt = hours == 0 ? '' : '${hours}h';
    hoursTxt += minutes == 0 ? '' : ' ';

    final minutesTxt = minutes == 0 ? '' : '${minutes}m';
    return '$hoursTxt$minutesTxt';
  }

  get _difficulty {
    const diffData = {
      0: [Colors.green, "Easy"],
      1: [Colors.orange, "Difficult"],
      2: [Colors.red, "Extreme"],
    };

    return diffData[hike.difficulty];
  }
}
