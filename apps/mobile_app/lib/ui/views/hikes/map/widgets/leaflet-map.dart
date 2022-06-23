import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/ui/presenters/map/leaflet-map-presenter.dart';
import 'package:collection/collection.dart';

import '../../../../../domain/entities/entities.dart';

typedef PoiMarkerBuilder = Marker Function(
    BuildContext context, Poi poi, int poiIndex);

class LeafletMap extends ConsumerStatefulWidget {
  final PoiMarkerBuilder? poiMarkerBuilder;
  final List<Poi>? pois;
  final Hike? hike;
  final String mapKey;

  const LeafletMap(
      {Key? key,
      this.poiMarkerBuilder,
      this.pois,
      required this.mapKey,
      this.hike})
      : super(key: key);

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
    final mapCenter = ref.watch(leafletMapMVPProvider(widget.mapKey).select(
        (md) =>
            md.mapCenter ??
            widget.hike?.startPoint ??
            widget.pois?.first.location ??
            const Location(lat: 0, lon: 0)));

    final presenter = ref.watch(leafletMapMVPProvider(widget.mapKey).notifier);

    return FlutterMap(
      options: MapOptions(
          onMapCreated: (ctr) {
            _mapController = ctr;
            presenter.mapController = ctr;
          },
          center: LatLng(mapCenter.lat, mapCenter.lon),
          zoom: _mapController?.zoom ?? 12),
      children: <Widget>[
        TileLayerWidget(
            options: TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'])),
        _getHikeLayerWidget(),
        _getMarkerLayerWidget(),
      ],
    );
  }

  Consumer _getHikeLayerWidget() {
    return Consumer(builder: (c, ref, _child) {
      final hikes = ref
          .watch(leafletMapMVPProvider(widget.mapKey).select((md) => md.hikes));

      final mapHikes =
          hikes.isEmpty ? (widget.hike == null ? [] : [widget.hike]) : hikes;

      final polylines = mapHikes
          .map<Polyline>((hike) => Polyline(
              color: const Color(0xAAFF0000),
              strokeWidth: 4,
              borderColor: Colors.blue,
              borderStrokeWidth: 1,
              points: hike.route.coordinates
                  .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
                  .toList()))
          .toList();

      return PolylineLayerWidget(
          options: PolylineLayerOptions(polylines: polylines));
    });
  }

  _getMarkerLayerWidget() {
    return Consumer(builder: (c, ref, _child) {
      final pois = ref
          .watch(leafletMapMVPProvider(widget.mapKey).select((md) => md.pois));

      final markerPois = pois.isEmpty ? widget.pois : pois;

      final markers = widget.poiMarkerBuilder == null || markerPois == null
          ? const <Marker>[]
          : markerPois
              .mapIndexed<Marker>(
                  (index, poi) => widget.poiMarkerBuilder!(context, poi, index))
              .toList();

      return MarkerLayerWidget(options: MarkerLayerOptions(markers: markers));
    });
  }
}
