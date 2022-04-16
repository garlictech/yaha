import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/domain.dart';

import '../../poi/poi.dart';

@immutable
class PoisOfHikeMap extends ConsumerWidget {
  final List<PoiOfHike> pois;
  final Hike hike;
  const PoisOfHikeMap({Key? key, required this.pois, required this.hike})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startPoint = hike.startPoint;
    final center = LatLng(startPoint.lat, startPoint.lon);

    final List<Marker> markers = pois
        .map((poi) => Marker(
            width: 25,
            height: 25,
            point: LatLng(poi.location.lat, poi.location.lon),
            builder: (ctx) => SizedBox(
                height: 24, width: 24, child: PoiIcon(poiType: poi.poiType))))
        .toList();

    final Polyline polyline = Polyline(
        color: const Color(0xAAFF0000),
        strokeWidth: 4,
        borderColor: Colors.blue,
        borderStrokeWidth: 1,
        points: hike.route.coordinates
            .map((coord) => LatLng(coord[1], coord[0]))
            .toList());

    return FlutterMap(
        //mapController: presenter.mapController,
        options: MapOptions(
          center: center,
          zoom: 11.0,
        ),
        //layers: [
        // PolylineLayerOptions(polylines: presenter.statefulMapController.lines)
        //],
        children: <Widget>[
          TileLayerWidget(
              options: TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'])),
          MarkerLayerWidget(
              options: MarkerLayerOptions(
            markers: markers,
          )),
          PolylineLayerWidget(
              options: PolylineLayerOptions(polylines: [polyline]))
        ]);
  }
}
