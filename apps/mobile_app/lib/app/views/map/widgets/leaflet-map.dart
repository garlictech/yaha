import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/app/presenters/map/leaflet-map-presenter.dart';
import 'package:collection/collection.dart';

import '../../../../domain/entities/entities.dart';

typedef PoiMarkerBuilder = Marker Function(
    BuildContext context, Poi poi, int poiIndex);

class LeafletMap extends ConsumerStatefulWidget {
  final PoiMarkerBuilder? poiMarkerBuilder;
  const LeafletMap({Key? key, this.poiMarkerBuilder}) : super(key: key);

  @override
  _LeafletMapState createState() => _LeafletMapState();
}

class _LeafletMapState extends ConsumerState<LeafletMap> {
  MapController? _mapController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapCenter = ref
        .watch(leafletMapMVPProvider(widget.key).select((md) => md.mapCenter));

    return FlutterMap(
      options: MapOptions(
          onMapCreated: (ctr) => _mapController = ctr,
          center: LatLng(mapCenter.lat, mapCenter.lon),
          zoom: _mapController?.zoom ?? 12),
      children: <Widget>[
        TileLayerWidget(
            options: TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'])),
        _getMarkerLayerWidget(),
        _getHikeLayerWidget()
      ],
    );
  }

  Consumer _getHikeLayerWidget() {
    return Consumer(builder: (c, ref, _child) {
      final hikes =
          ref.watch(leafletMapMVPProvider(widget.key).select((md) => md.hikes));

      final polylines = hikes
          .map<Polyline>((hike) => Polyline(
              color: const Color(0xAAFF0000),
              strokeWidth: 4,
              borderColor: Colors.blue,
              borderStrokeWidth: 1,
              points: hike.route.coordinates
                  .map((coord) => LatLng(coord[1], coord[0]))
                  .toList()))
          .toList();

      return PolylineLayerWidget(
          options: PolylineLayerOptions(polylines: polylines));
    });
  }

  Consumer _getMarkerLayerWidget() {
    return Consumer(builder: (c, ref, _child) {
      final pois =
          ref.watch(leafletMapMVPProvider(widget.key).select((md) => md.pois));

      final markers = widget.poiMarkerBuilder == null
          ? const <Marker>[]
          : pois
              .mapIndexed<Marker>(
                  (index, poi) => widget.poiMarkerBuilder!(context, poi, index))
              .toList();

      return MarkerLayerWidget(options: MarkerLayerOptions(markers: markers));
    });
  }
}
