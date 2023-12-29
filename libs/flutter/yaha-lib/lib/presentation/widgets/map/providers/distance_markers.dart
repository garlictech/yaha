import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_yaha_lib/domain/use-cases/hike/hike.dart';
import 'package:flutter_yaha_lib/ui/views/shared/widgets/yaha-colors.dart';

part 'distance_markers.g.dart';

@riverpod
class DistanceMarkers extends _$DistanceMarkers {
  @override
  FutureOr<List<Marker>> build(String hikeId) async {
    final hike = await ref.watch(configuredHikeProvider(hikeId).future);

    return hike.distanceMarkers
        .mapIndexed((index, d) => Marker(
            height: 18,
            width: 18,
            point: d,
            child: SizedBox(
                child: PhysicalModel(
                    color: YahaColors.gunmetalGray,
                    shadowColor: Colors.black,
                    elevation: 8.0,
                    shape: BoxShape.circle,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text((index + 1).toString(),
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white)))))))
        .toList();
  }
}
