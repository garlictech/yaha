import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:yaha/domain/use-cases/hike/hike_with_bounds.dart';
import '../../../domain/entities/entities.dart';
import 'distance_markers.dart';
import 'global_map_control.dart';
import 'global_markers.dart';
import 'hike_map_control.dart';
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
    final hikeWithBounds = ref.watch(hikeWithBoundsProvider(widget.hikeId));
    final globalMarkers = ref.watch(globalMarkersProvider);
    final distanceMarkers = ref.watch(distanceMarkersProvider(widget.hikeId));

    if (hikeWithBounds == null) {
      return Container();
    }
    final hike = hikeWithBounds.value1;
    final bounds = hikeWithBounds.value2;

    return Stack(children: [
      FlutterMap(
        mapController: _mapController,
        options: MapOptions(bounds: bounds),
        children: <Widget>[
          yahaTileLayer,
          _getHikeLayerWidget(hike),
          _getMarkerLayerWidget([...globalMarkers, ...distanceMarkers]),
          _getMarkerClusterLayerWidget(),
        ],
      ),
      Align(
          alignment: Alignment.bottomRight,
          child: Container(
              margin: EdgeInsets.only(bottom: widget.cardHeight),
              child: GlobalMapControl(
                  mapcontroller: _mapController, originalBounds: bounds))),
      Align(
          alignment: Alignment.bottomLeft,
          child: Container(
              margin: EdgeInsets.only(bottom: widget.cardHeight),
              child: HikeMapControl(hikeId: widget.hikeId))),
    ]);
  }

  _getHikeLayerWidget(Hike hike) {
    final line = Function.apply(Polyline.new, [], trackBaseProps(hike));
    return PolylineLayer(polylines: [line]);
  }

  _getMarkerLayerWidget(List<Marker> globalMarkers) {
    return MarkerLayer(
      markers: globalMarkers,
    );
  }

  _getMarkerClusterLayerWidget() {
    return Consumer(builder: (c, ref, child) {
      final markers = widget.poiMarkerBuilder == null
          ? const <Marker>[]
          : widget.pois
              .mapIndexed<Marker>(
                  (index, poi) => widget.poiMarkerBuilder!(context, poi, index))
              .toList();

      return MarkerClusterLayerWidget(
        options: MarkerClusterLayerOptions(
          markers: markers,
          maxClusterRadius: 45,
          size: const Size(40, 40),
          anchor: AnchorPos.align(AnchorAlign.center),
          fitBoundsOptions: const FitBoundsOptions(
            padding: EdgeInsets.all(50),
            maxZoom: 15,
          ),
          builder: (context, markers) {
            final bool isCurrentInCluster = markers.where((marker) {
              return marker.key.toString() == const Key("CURRENT").toString();
            }).isNotEmpty;

            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isCurrentInCluster
                      ? Colors.red
                      : Theme.of(context).primaryColor),
              child: Center(
                child: Text(
                  markers.length.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
