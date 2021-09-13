import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/utility/yaha-colors.dart';

import 'checkpoint.dart';
import 'route-section.dart';

const List<Object> defaultNodeList = [
  CheckpointModel(
    title: "START",
    boxBackgorundColor: YahaColors.secondary,
    backgroundColor: YahaColors.secondary,
    icon: Icons.outlined_flag_rounded,
    iconSize: 40,
    estimatedArrival: "11:30",
  ),
  RouteSectionModel(
    estimatedArrival: "11:30",
    routeLength: "2.3 km",
  ),
  CheckpointModel(
    title: "Something interesting",
    boxBackgorundColor: Colors.cyan,
    backgroundColor: Colors.cyan,
    icon: Icons.outdoor_grill,
    iconSize: 40,
    estimatedArrival: "12:30",
  )
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
