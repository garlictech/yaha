import 'package:dartz/dartz.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../entities/hike/hike.dart';
import '../use-cases/hike/cached_hike.dart';
import 'hike-utility-services.dart';

part "hike_list_stream_with_bounds.g.dart";

@riverpod
class HikeListStreamWithBounds extends _$HikeListStreamWithBounds {
  @override
  Stream<Tuple2<List<Hike>, LatLngBounds>> build(String hikeId) {
    final hikeUtilityServices = ref.read(hikeUtilityServicesProvider);
    return Stream.fromFuture(ref.watch(cachedHikeProvider(hikeId).future))
        .switchMap((value) {
      return hikeUtilityServices.getHikeListStreamWithBounds([hikeId]);
    });
  }
}
