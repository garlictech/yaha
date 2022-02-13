import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/presenters/map/leaflet-map-presenter.dart';

@immutable
class LeafletMap extends ConsumerWidget {
  const LeafletMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    watch(leafletMapMVPProvider);
    final presenter = watch(leafletMapMVPProvider.notifier);

    return Scaffold(
      body: SafeArea(
          child: FlutterMap(
        mapController: presenter.mapController,
        options: MapOptions(
          center: LatLng(47.251956, 17.728452),
          zoom: 11.0,
        ),
        layers: [
          presenter.statefulMapController.tileLayer,
          MarkerLayerOptions(
            markers: presenter.statefulMapController.markers,
          ),
          PolylineLayerOptions(polylines: presenter.statefulMapController.lines)
        ],
      )),
    );
  }
}
