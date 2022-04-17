/*import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/domain.dart';
import 'package:yaha/providers/providers.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../../poi/poi.dart';

@immutable
class PoisOfHikeMap extends ConsumerWidget {
  final List<PoiOfHike> pois;
  final Hike hike;
  late MapZoomPanBehavior _zoomPanBehavior;
  late MapTileLayerController _mapController;
  //final MapWrapperController mapController;

  PoisOfHikeMap({Key? key, required this.pois, required this.hike})
      : // mapController = MapWrapperController(),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startPoint = hike.startPoint;
    final center = MapLatLng(startPoint.lat, startPoint.lon);
    _zoomPanBehavior = MapZoomPanBehavior(
        minZoomLevel: 3,
        maxZoomLevel: 10,
        focalLatLng: center,
        //MapLatLng(_worldWonders[_currentSelectedIndex].latitude,
        //  _worldWonders[_currentSelectedIndex].longitude),
        enableDoubleTapZooming: true,
        zoomLevel: 5);
    _mapController = MapTileLayerController();

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

    return SfMaps(layers: <MapLayer>[
      MapTileLayer(

          /// URL to request the tiles from the providers.
          ///
          /// The [urlTemplate] accepts the URL in WMTS format i.e. {z} —
          /// zoom level, {x} and {y} — tile coordinates.
          ///
          /// We will replace the {z}, {x}, {y} internally based on the
          /// current center point and the zoom level.
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          zoomPanBehavior: _zoomPanBehavior,
          controller: _mapController,
          initialMarkersCount: 0, //_worldWonders.length,
          tooltipSettings: const MapTooltipSettings(
            color: Colors.transparent,
          ))
    ]);

    FlutterMapWrapper(
        wrapperController: mapController,
        options: MapOptions(center: center, zoom: 11.0),
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
              options: PolylineLayerOptions(polylines: [polyline])),
        ],
        nonRotatedChildren: [
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {
                final geoLoc = ref.read(geoLocationRepositoryProvider);
                geoLoc.getCurrentLocation().then((loc) {
                  debugPrint("******LOC $loc");
                  mapController.controller
                      .move(LatLng(loc.latitude, loc.longitude), 11);
                });
              },
              child: const Icon(
                Icons.my_location,
                color: Colors.white,
              ),
            ),
          )

        ]);
  }
}*/

/// Flutter package imports
import 'package:flutter/material.dart';

///Map import
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:yaha/app/views/hikes/widgets/hike-card-list.dart';
import 'package:yaha/domain/domain.dart' as domain;

import '../../poi/widgets/poi-icon.dart';

/// Base class of the sample's stateful widget class
abstract class SampleView extends StatefulWidget {
  /// base class constructor of sample's stateful widget class
  const SampleView({Key? key}) : super(key: key);
}

/// Base class of the sample's state class
abstract class SampleViewState<T extends SampleView> extends State<T> {
  /// Holds the information of current page is card view or not
  late bool isCardView;

  @override
  void initState() {
    super.initState();
  }

  /// Must call super.
  @override
  void dispose() {
    super.dispose();
  }

  /// Get the settings panel content.
  Widget? buildSettings(BuildContext context) {
    return null;
  }
}

/// Renders the map widget with OSM map.
class PoisOfHikeMap extends SampleView {
  final List<domain.PoiOfHike> pois;
  final domain.Hike hike;

  /// Creates the map widget with OSM map.
  const PoisOfHikeMap({Key? key, required this.pois, required this.hike})
      : super(key: key);

  @override
  _TileLayerSampleState createState() =>
      _TileLayerSampleState(hike: hike, pois: pois);
}

class _TileLayerSampleState extends SampleViewState
    with SingleTickerProviderStateMixin {
  late PageController _pageViewController;
  late MapTileLayerController _mapController;

  late MapZoomPanBehavior _zoomPanBehavior;

  late List<_WonderDetails> _worldWonders;

  late int _currentSelectedIndex;
  late int _previousSelectedIndex;
  late int _tappedMarkerIndex;

  late double _cardHeight;
  late Animation<double> _animation;
  AnimationController? _animationController;
  late bool _canUpdateFocalLatLng;
  late bool _canUpdateZoomLevel;
  late bool _isDesktop;
  final List<domain.PoiOfHike> pois;
  final domain.Hike hike;

  _TileLayerSampleState({required this.pois, required this.hike});

  @override
  void initState() {
    super.initState();
    _currentSelectedIndex = 5;
    _canUpdateFocalLatLng = true;
    _canUpdateZoomLevel = true;
    _mapController = MapTileLayerController();
    _worldWonders = pois
        .map<_WonderDetails>((poi) => _WonderDetails(
            latitude: poi.location.lat,
            longitude: poi.location.lon,
            description: poi.description?[0].summary ?? '',
            title: poi.title,
            tooltipImagePath: '',
            icon: PoiIcon(poiType: poi.poiType)))
        .toList();

    _zoomPanBehavior = MapZoomPanBehavior(
      minZoomLevel: 3,
      maxZoomLevel: 12,
      focalLatLng: MapLatLng(_worldWonders[_currentSelectedIndex].latitude,
          _worldWonders[_currentSelectedIndex].longitude),
      enableDoubleTapZooming: true,
    );

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _mapController.dispose();
    _worldWonders.clear();
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    _isDesktop = themeData.platform == TargetPlatform.macOS ||
        themeData.platform == TargetPlatform.windows ||
        themeData.platform == TargetPlatform.linux;
    if (_canUpdateZoomLevel) {
      _zoomPanBehavior.zoomLevel = 12;
      _canUpdateZoomLevel = false;
    }
    _cardHeight = (MediaQuery.of(context).orientation == Orientation.landscape)
        ? (_isDesktop ? 120 : 90)
        : 110;
    _pageViewController = PageController(
        initialPage: _currentSelectedIndex,
        viewportFraction:
            (MediaQuery.of(context).orientation == Orientation.landscape)
                ? (_isDesktop ? 0.5 : 0.7)
                : 0.8);
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            'images/maps_grid.png',
            repeat: ImageRepeat.repeat,
          ),
        ),
        SfMaps(
          layers: <MapLayer>[
            MapTileLayer(
              /// URL to request the tiles from the providers.
              ///
              /// The [urlTemplate] accepts the URL in WMTS format i.e. {z} —
              /// zoom level, {x} and {y} — tile coordinates.
              ///
              /// We will replace the {z}, {x}, {y} internally based on the
              /// current center point and the zoom level.
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              zoomPanBehavior: _zoomPanBehavior,
              controller: _mapController,
              initialMarkersCount: _worldWonders.length,
              tooltipSettings: const MapTooltipSettings(
                color: Colors.transparent,
              ),
              markerTooltipBuilder: (BuildContext context, int index) {
                if (_isDesktop) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          /*Container(
                            width: 150,
                            height: 80,
                            color: Colors.grey,
                            child: Image.asset(
                              _worldWonders[index].tooltipImagePath,
                              fit: BoxFit.fill,
                            ),
                          ),*/
                        ]),
                  );
                }

                return const SizedBox();
              },
              sublayers: <MapSublayer>[
                MapPolylineLayer(polylines: <MapPolyline>{
                  MapPolyline(
                    points: hike.route.coordinates
                        .map((coord) => MapLatLng(coord[1], coord[0]))
                        .toList(),
                    color: const Color.fromRGBO(0, 102, 255, 1.0),
                    width: 6.0,
                  )
                } //, animation: _animation
                    )
              ],
              markerBuilder: (BuildContext context, int index) {
                final double _markerSize =
                    _currentSelectedIndex == index ? 40 : 25;
                return MapMarker(
                  latitude: _worldWonders[index].latitude,
                  longitude: _worldWonders[index].longitude,
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      if (_currentSelectedIndex != index) {
                        _canUpdateFocalLatLng = false;
                        _tappedMarkerIndex = index;
                        _pageViewController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      height: _markerSize,
                      width: _markerSize,
                      child: FittedBox(
                        child: Icon(Icons.location_on,
                            color: _currentSelectedIndex == index
                                ? Colors.blue
                                : Colors.red,
                            size: _markerSize),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: _cardHeight,
            padding: const EdgeInsets.only(bottom: 10),

            /// PageView which shows the world wonder details at the bottom.
            child: PageView.builder(
              itemCount: _worldWonders.length,
              onPageChanged: _handlePageChange,
              controller: _pageViewController,
              itemBuilder: (BuildContext context, int index) {
                final _WonderDetails item = _worldWonders[index];
                return Transform.scale(
                  scale: index == _currentSelectedIndex ? 1 : 0.85,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(66, 66, 66, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(153, 153, 153, 1),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(children: <Widget>[
                          // Adding title and description for card.
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, right: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(item.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 5),
                                Expanded(
                                    child: Text(
                                  item.description,
                                  style: const TextStyle(fontSize: 11),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: (index == 2 || index == 6) ? 2 : 4,
                                ))
                              ],
                            ),
                          )),
                          // Adding Image for card.
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            child: SizedBox(
                                height: _cardHeight - 10,
                                width: _cardHeight - 10,
                                child: item.icon)
                            /*child: Image.asset(
                              item.imagePath,
                              height: _cardHeight - 10,
                              width: _cardHeight - 10,
                              fit: BoxFit.fill,
                            )*/
                            ,
                          )
                        ]),
                      ),
                      // Adding splash to card while tapping.
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.elliptical(10, 10)),
                          onTap: () {
                            if (_currentSelectedIndex != index) {
                              _pageViewController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void _handlePageChange(int index) {
    /// While updating the page viewer through interaction, selected position's
    /// marker should be moved to the center of the maps. However, when the
    /// marker is directly clicked, only the respective card should be moved to
    /// center and the marker itself should not move to the center of the maps.
    if (!_canUpdateFocalLatLng) {
      if (_tappedMarkerIndex == index) {
        _updateSelectedCard(index);
      }
    } else if (_canUpdateFocalLatLng) {
      _updateSelectedCard(index);
    }
  }

  void _updateSelectedCard(int index) {
    setState(() {
      _previousSelectedIndex = _currentSelectedIndex;
      _currentSelectedIndex = index;
    });

    /// While updating the page viewer through interaction, selected position's
    /// marker should be moved to the center of the maps. However, when the
    /// marker is directly clicked, only the respective card should be moved to
    /// center and the marker itself should not move to the center of the maps.
    if (_canUpdateFocalLatLng) {
      _zoomPanBehavior.focalLatLng = MapLatLng(
          _worldWonders[_currentSelectedIndex].latitude,
          _worldWonders[_currentSelectedIndex].longitude);
    }

    /// Updating the design of the selected marker. Please check the
    /// `markerBuilder` section in the build method to know how this is done.
    _mapController
        .updateMarkers(<int>[_currentSelectedIndex, _previousSelectedIndex]);
    _canUpdateFocalLatLng = true;
  }
}

class _WonderDetails {
  const _WonderDetails(
      {required this.title,
      //required this.imagePath,
      required this.icon,
      required this.latitude,
      required this.longitude,
      required this.description,
      required this.tooltipImagePath});

  final String title;
  final double latitude;
  final double longitude;
  final String description;
  final PoiIcon icon;
  //final String imagePath;
  final String tooltipImagePath;
}
