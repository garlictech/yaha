import 'package:dartz/dartz.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../entities/hike/hike.dart';
import 'hike_list.dart';

part 'hike_list_with_bounds.g.dart';

@riverpod
class HikeListWithBounds extends _$HikeListWithBounds {
  @override
  Tuple2<List<Hike>, LatLngBounds> build() {
    final hikes = ref.watch(hikeListProvider);
    final bounds = LatLngBounds();
    hikes.map((hike) => hike.route.coordinates).expand((i) => i).forEach(
        (point) => bounds
            .extend(LatLng(point.location.latitude, point.location.longitude)));
    bounds.pad(0.2);
    return Tuple2(hikes, bounds);
  }
}
