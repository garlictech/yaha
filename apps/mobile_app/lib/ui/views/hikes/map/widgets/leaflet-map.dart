import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:collection/collection.dart';
import '/app/geolocation-providers.dart';

import '../../../../../domain/entities/entities.dart';
import '../../../../presenters/map/map.dart';

typedef PoiMarkerBuilder = Marker Function(
    BuildContext context, Poi poi, int poiIndex);

class LeafletMap extends ConsumerStatefulWidget {
  final PoiMarkerBuilder? poiMarkerBuilder;
  final List<Poi> pois;
  final List<Hike> hikes;

  const LeafletMap(
      {Key? key,
      this.poiMarkerBuilder,
      this.pois = const [],
      this.hikes = const []})
      : super(key: key);

  @override
  LeafletMapState createState() => LeafletMapState();
}

class LeafletMapState extends ConsumerState<LeafletMap> {
  MapController? _mapController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapCenter =
        (widget.hikes.isNotEmpty ? widget.hikes.first.startPoint : null) ??
            (widget.pois.isNotEmpty ? widget.pois.first.location : null);
    final presenter = ref.watch(leafletMapMVPProvider.notifier);

    if (mapCenter == null) {
      ref
          .read(geoLocationRepositoryProvider)
          .getCurrentLocation()
          .then((currentLocation) {
        presenter.mapCenter = Location(
            lat: currentLocation.latitude, lon: currentLocation.longitude);
      });
    }

    return FlutterMap(
      options: MapOptions(
          onMapCreated: (ctr) {
            _mapController = ctr;
            presenter.mapController = ctr;
          },
          center: LatLng(mapCenter?.lat ?? 0, mapCenter?.lon ?? 0),
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
    return Consumer(builder: (c, ref, child) {
      final polylines = widget.hikes
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
    return Consumer(builder: (c, ref, child) {
      final markers = widget.poiMarkerBuilder == null
          ? const <Marker>[]
          : widget.pois
              .mapIndexed<Marker>(
                  (index, poi) => widget.poiMarkerBuilder!(context, poi, index))
              .toList();

      return MarkerLayerWidget(options: MarkerLayerOptions(markers: markers));
    });
  }
}
