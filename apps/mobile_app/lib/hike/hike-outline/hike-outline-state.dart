import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/utility/yaha-colors.dart';

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
  ),
  RouteSectionModel(
    routeLengthInTime: "8",
    routeLengthInTimeMetrics: "min",
    routeLength: "750",
    routeLengthMetrics: "m",
  ),
  CheckpointModel(
    title: "Museum 1",
    boxBackgorundColor: YahaColors.military,
    backgroundColor: YahaColors.military,
    icon: Icons.museum_rounded,
    iconSize: 40,
    estimatedArrival: "11:38",
  ),
  RouteSectionModel(
    routeLengthInTime: "5",
    routeLengthInTimeMetrics: "min",
    routeLength: "450",
    routeLengthMetrics: "m",
  ),
  CheckpointModel(
    title: "Museum 2",
    boxBackgorundColor: YahaColors.military,
    backgroundColor: YahaColors.military,
    icon: Icons.museum_rounded,
    iconSize: 40,
    estimatedArrival: "11:43",
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
