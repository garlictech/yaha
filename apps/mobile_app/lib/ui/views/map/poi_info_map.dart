import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/services/services.dart';
import 'package:yaha/ui/views/poi/poi-icon.dart';

import '../../../domain/entities/entities.dart';
import 'leaflet_map_widgets.dart';

class PoiInfoMap extends ConsumerStatefulWidget {
  final String hikeId;
  final Poi poi;

  const PoiInfoMap({Key? key, required this.hikeId, required this.poi})
      : super(key: key);

  @override
  PoiInfoMapState createState() => PoiInfoMapState();
}

class PoiInfoMapState extends ConsumerState<PoiInfoMap> {
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

    final marker = Marker(
        point:
            LatLng(widget.poi.geoPoint.latitude, widget.poi.geoPoint.longitude),
        builder: (BuildContext c) {
          return SizedBox(
              height: markerSize,
              width: markerSize,
              child: PhysicalModel(
                  color: Colors.black,
                  shadowColor: Colors.black,
                  elevation: 8.0,
                  shape: BoxShape.circle,
                  child: PoiIcon(poiType: widget.poi.poiType)));
        });
    return MarkerLayer(markers: [marker]);
  }
}
