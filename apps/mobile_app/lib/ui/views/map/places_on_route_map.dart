import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:collection/collection.dart';
import 'package:yaha/domain/services/hike-utility-services.dart';
import '../../../app/providers.dart';

import '../../../domain/entities/entities.dart';
import '../../presenters/map/map.dart';
import 'leaflet_map_widgets.dart';

typedef PoiMarkerBuilder = Marker Function(
    BuildContext context, Poi poi, int poiIndex);

class PlacesOnRouteMap extends ConsumerStatefulWidget {
  final PoiMarkerBuilder? poiMarkerBuilder;
  final List<Poi> pois;
  final String hikeId;

  const PlacesOnRouteMap(
      {Key? key,
      this.poiMarkerBuilder,
      this.pois = const [],
      required this.hikeId})
      : super(key: key);

  @override
  PlacesOnRouteMapState createState() => PlacesOnRouteMapState();
}

class PlacesOnRouteMapState extends ConsumerState<PlacesOnRouteMap> {
  MapController? _mapController;

  get yahaTtileLayer => null;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hikeUtilityServices = ref.read(hikeUtilityServicesProvider);
    final hikeWithBounds = hikeUtilityServices
        .getHikeListStreamWithBounds([widget.hikeId], boundingRation: 0.25);

    return StreamBuilder(
        stream: hikeWithBounds,
        builder: (context,
            AsyncSnapshot<Tuple2<List<Hike>, LatLngBounds>> snapshot) {
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          }

          final hike = snapshot.data!.value1[0];
          final bounds = snapshot.data!.value2;
          return FlutterMap(
            options:
                MapOptions(bounds: bounds, zoom: _mapController?.zoom ?? 12),
            children: <Widget>[
              yahaTileLayer,
              _getHikeLayerWidget(hike),
              _getMarkerLayerWidget(),
            ],
          );
        });
  }

  _getHikeLayerWidget(Hike hike) {
    final line = Function.apply(Polyline.new, [], trackBaseProps(hike));
    return PolylineLayer(polylines: [line]);
  }

  _getMarkerLayerWidget() {
    return Consumer(builder: (c, ref, child) {
      final markers = widget.poiMarkerBuilder == null
          ? const <Marker>[]
          : widget.pois
              .mapIndexed<Marker>(
                  (index, poi) => widget.poiMarkerBuilder!(context, poi, index))
              .toList();

      return MarkerLayer(markers: markers);
    });
  }
}
