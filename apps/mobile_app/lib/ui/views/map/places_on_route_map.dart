import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:yaha/domain/services/hike-utility-services.dart';

import '../../../domain/entities/entities.dart';
import 'global_map_control.dart';
import 'global_markers.dart';
import 'leaflet_map_widgets.dart';

typedef PoiMarkerBuilder = Marker Function(
    BuildContext context, Poi poi, int poiIndex);

class PlacesOnRouteMap extends ConsumerStatefulWidget {
  final PoiMarkerBuilder? poiMarkerBuilder;
  final List<Poi> pois;
  final String hikeId;
  final double cardHeight;

  const PlacesOnRouteMap(
      {Key? key,
      this.poiMarkerBuilder,
      this.pois = const [],
      required this.hikeId,
      required this.cardHeight})
      : super(key: key);

  @override
  PlacesOnRouteMapState createState() => PlacesOnRouteMapState();
}

class PlacesOnRouteMapState extends ConsumerState<PlacesOnRouteMap> {
  final MapController _mapController = MapController();

  get yahaTtileLayer => null;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hikeUtilityServices = ref.read(hikeUtilityServicesProvider);
    final hikeWithBounds =
        hikeUtilityServices.getHikeListStreamWithBounds([widget.hikeId]);
    final globalMarkers = ref.watch(globalMarkersProvider);

    return StreamBuilder(
        stream: hikeWithBounds,
        builder: (context,
            AsyncSnapshot<Tuple2<List<Hike>, LatLngBounds>> snapshot) {
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          }

          final hike = snapshot.data!.value1[0];
          final bounds = snapshot.data!.value2;
          return Stack(children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(bounds: bounds),
              children: <Widget>[
                yahaTileLayer,
                _getHikeLayerWidget(hike),
                _getMarkerLayerWidget(globalMarkers),
              ],
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    margin: EdgeInsets.only(bottom: widget.cardHeight),
                    child: GlobalMapControl(
                        mapcontroller: _mapController,
                        originalBounds: bounds))),
          ]);
        });
  }

  _getHikeLayerWidget(Hike hike) {
    final line = Function.apply(Polyline.new, [], trackBaseProps(hike));
    return PolylineLayer(polylines: [line]);
  }

  _getMarkerLayerWidget(List<Marker> globalMarkers) {
    return Consumer(builder: (c, ref, child) {
      final markers = widget.poiMarkerBuilder == null
          ? const <Marker>[]
          : widget.pois
              .mapIndexed<Marker>(
                  (index, poi) => widget.poiMarkerBuilder!(context, poi, index))
              .toList();

      return MarkerLayer(markers: [...markers, ...globalMarkers]);
    });
  }
}
