import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/hike/hike-outline/checkpoint.dart';
import 'package:yaha/hike/hike-outline/route-section.dart';
import 'package:yaha/hike/hike-outline/views/widgets/timecapsule-on-hike-outline-widget.dart';
import 'package:yaha/hike/hike-outline/weather-astronomical-data.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

const List<Object> defaultNodeList = [
  CheckpointModel(
    title: "Start",
    boxBackgorundColor: YahaColors.secondary,
    backgroundColor: YahaColors.secondary,
    icon: Icons.outlined_flag_rounded,
    iconSize: YahaIconSizes.xxLarge,
    estimatedArrival: "7:30",
    padding: YahaSpaceSizes.small,
    radius: YahaBoxSizes.circleAvatarRadiusLarge,
  ),
  DottedLine(
    direction: Axis.vertical,
    lineLength: 40.0,
    lineThickness: 4.0,
    dashRadius: 20.0,
    dashGapLength: 5.0,
    dashColor: YahaColors.textColor,
  ),
  WeatherAstronomicalData(
    icon: "assets/images/sunrise.png",
    text: "Sunrise at 7:33",
  ),
  DottedLine(
    direction: Axis.vertical,
    lineLength: 40.0,
    lineThickness: 4.0,
    dashRadius: 20.0,
    dashGapLength: 5.0,
    dashColor: YahaColors.textColor,
  ),
  RouteSectionModel(
    routeLengthInTime: "8",
    routeLengthInTimeMetrics: "min",
    routeLength: "750",
    routeLengthMetrics: "m",
  ),
  DottedLine(
    direction: Axis.vertical,
    lineLength: 50.0,
    lineThickness: 4.0,
    dashRadius: 20.0,
    dashGapLength: 5.0,
    dashColor: YahaColors.textColor,
  ),
  CheckpointModel(
    title: "Museum 1",
    boxBackgorundColor: YahaColors.generic,
    backgroundColor: YahaColors.generic,
    icon: Icons.museum_rounded,
    iconSize: YahaIconSizes.xxLarge,
    estimatedArrival: "7:38",
    padding: YahaSpaceSizes.small,
    radius: YahaBoxSizes.circleAvatarRadiusLarge,
  ),
  DottedLine(
    direction: Axis.vertical,
    lineLength: 40.0,
    lineThickness: 4.0,
    dashRadius: 20.0,
    dashGapLength: 5.0,
    dashColor: YahaColors.textColor,
  ),
  TimeCapsuleOnHikeOutlineScreen(text: 'TimeCapsule nearby'),
  DottedLine(
    direction: Axis.vertical,
    lineLength: 40.0,
    lineThickness: 4.0,
    dashRadius: 20.0,
    dashGapLength: 5.0,
    dashColor: YahaColors.textColor,
  ),
  RouteSectionModel(
    routeLengthInTime: "5",
    routeLengthInTimeMetrics: "min",
    routeLength: "450",
    routeLengthMetrics: "m",
  ),
  DottedLine(
    direction: Axis.vertical,
    lineLength: 40.0,
    lineThickness: 4.0,
    dashRadius: 20.0,
    dashGapLength: 5.0,
    dashColor: YahaColors.textColor,
  ),
  WeatherAstronomicalData(
    icon: "assets/images/rain.png",
    text: "80% chance of rain around 7:40",
  ),
  DottedLine(
    direction: Axis.vertical,
    lineLength: 40.0,
    lineThickness: 4.0,
    dashRadius: 20.0,
    dashGapLength: 5.0,
    dashColor: YahaColors.textColor,
  ),
  CheckpointModel(
    title: "Museum 2",
    boxBackgorundColor: YahaColors.generic,
    backgroundColor: YahaColors.generic,
    icon: Icons.museum_rounded,
    iconSize: YahaIconSizes.xxLarge,
    estimatedArrival: "7:43",
    padding: YahaSpaceSizes.small,
    radius: YahaBoxSizes.circleAvatarRadiusLarge,
  ),
];

class TrackingTimelineScreenState {
  final List<Object> nodeList;

  TrackingTimelineScreenState() : nodeList = defaultNodeList;
}

class TrackingTimelineScreenStateNotifier
    extends StateNotifier<TrackingTimelineScreenState> {
  TrackingTimelineScreenStateNotifier() : super(TrackingTimelineScreenState());

  updateState(TrackingTimelineScreenState newState) => state = newState;
}

final trackingTimelineStateProvider =
    FutureProvider<TrackingTimelineScreenState>((ref) async {
  return TrackingTimelineScreenState();
});
