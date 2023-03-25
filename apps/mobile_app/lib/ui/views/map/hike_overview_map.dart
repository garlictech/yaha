import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/services/services.dart';
import 'package:yaha/ui/views/poi/poi-icon.dart';

import '../../../domain/entities/entities.dart';
import 'leaflet_map_widgets.dart';

class HikeOverviewMap extends ConsumerStatefulWidget {
  final String hikeId;

  const HikeOverviewMap({Key? key, required this.hikeId}) : super(key: key);

  @override
  HikeOverviewMapState createState() => HikeOverviewMapState();
}

class HikeOverviewMapState extends ConsumerState<HikeOverviewMap> {
  MapController? _mapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hikeUtilityServices = ref.read(hikeUtilityServicesProvider);
    final hikeWithBounds =
        hikeUtilityServices.getHikeListStreamWithBounds([widget.hikeId]);

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
              options:
                  MapOptions(bounds: bounds, zoom: _mapController?.zoom ?? 12),
              children: <Widget>[
                yahaTileLayer,
                _getHikeLayerWidget(hike),
                _getMarkerLayerWidget(hike),
              ],
            ),
          ]);
        });
  }

  _getHikeLayerWidget(Hike hike) {
    final line = Function.apply(Polyline.new, [], trackBaseProps(hike));
    return PolylineLayer(polylines: [line]);
  }

  _getMarkerLayerWidget(Hike hike) {
    const markerSize = 40.0;

    markerShape(PoiIcon icon, ref) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            )
          ],
        ),
        child: icon);

    final startMarker = Marker(
        height: markerSize,
        width: markerSize,
        point: LatLng(hike.startPoint.latitude, hike.startPoint.longitude),
        builder: (c) {
          return markerShape(
              const PoiIcon(
                  poiType: PoiType(category: "yaha", kind: "start_hike")),
              ref);
        });
    final endMarker = Marker(
        height: markerSize,
        width: markerSize,
        point: LatLng(hike.endPoint.latitude, hike.endPoint.longitude),
        builder: (c) {
          return markerShape(
              const PoiIcon(
                  poiType: PoiType(category: "yaha", kind: "finish_hike")),
              ref);
        });
    return MarkerLayer(markers: [startMarker, endMarker]);
  }
}
