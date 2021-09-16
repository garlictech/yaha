import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

import 'checkpoint.dart';
import 'route-section.dart';

const List<Object> defaultNodeList = [
  CheckpointModel(
    title: "Start",
    boxBackgorundColor: YahaColors.secondary,
    backgroundColor: YahaColors.secondary,
    icon: Icons.outlined_flag_rounded,
    iconSize: 40,
    estimatedArrival: "11:30",
    padding: YahaSpaceSizes.small,
  ),
  DottedLine(),
  RouteSectionModel(
    routeLengthInTime: "8",
    routeLengthInTimeMetrics: "min",
    routeLength: "750",
    routeLengthMetrics: "m",
  ),
  DottedLine(),
  CheckpointModel(
    title: "Museum 1",
    boxBackgorundColor: YahaColors.military,
    backgroundColor: YahaColors.military,
    icon: Icons.museum_rounded,
    iconSize: 40,
    estimatedArrival: "11:38",
    padding: YahaSpaceSizes.small,
  ),
  DottedLine(),
  RouteSectionModel(
    routeLengthInTime: "5",
    routeLengthInTimeMetrics: "min",
    routeLength: "450",
    routeLengthMetrics: "m",
  ),
  DottedLine(),
  CheckpointModel(
    title: "Museum 2",
    boxBackgorundColor: YahaColors.military,
    backgroundColor: YahaColors.military,
    icon: Icons.museum_rounded,
    iconSize: 40,
    estimatedArrival: "11:43",
    padding: YahaSpaceSizes.small,
  ),
];

class HikeOutlineState {
  final List<Object> nodeList;

  HikeOutlineState() : nodeList = defaultNodeList;
}

class HikeOutlineStateNotifier extends StateNotifier<HikeOutlineState> {
  HikeOutlineStateNotifier() : super(HikeOutlineState());

  updateState(HikeOutlineState newState) => state = newState;
}

final hikeOutlineStateProvider = FutureProvider<HikeOutlineState>((ref) async {
  return HikeOutlineState();
});
