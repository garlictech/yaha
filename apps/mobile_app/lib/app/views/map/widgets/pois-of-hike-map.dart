import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Map import
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:yaha/domain/domain.dart' as domain;
import 'package:yaha/providers/providers.dart';

import '../../poi/widgets/poi-icon.dart';

/// Renders the map widget with OSM map.
class PoisOfHikeMap extends ConsumerStatefulWidget {
  final List<domain.PoiOfHike> pois;
  final domain.Hike hike;

  /// Creates the map widget with OSM map.
  const PoisOfHikeMap({Key? key, required this.pois, required this.hike})
      : super(key: key);

  @override
  _PoisOfHikeMapState createState() => _PoisOfHikeMapState();
}

class _PoisOfHikeMapState extends ConsumerState<PoisOfHikeMap>
    with SingleTickerProviderStateMixin {
  late PageController _pageViewController;
  late MapTileLayerController _mapController;

  late MapZoomPanBehavior _zoomPanBehavior;
  late int _currentSelectedIndex;
  late int _previousSelectedIndex;
  late int _tappedMarkerIndex;

  late double _cardHeight;
  late Animation<double> _animation;
  AnimationController? _animationController;
  late bool _canUpdateFocalLatLng;

  @override
  void initState() {
    _currentSelectedIndex = 0;
    _canUpdateFocalLatLng = true;
    _mapController = MapTileLayerController();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    );
    _zoomPanBehavior = MapZoomPanBehavior(
      minZoomLevel: 3,
      maxZoomLevel: 18,
      zoomLevel: 12,
      focalLatLng: widget.pois.isEmpty
          ? const MapLatLng(0, 0)
          : MapLatLng(widget.pois[_currentSelectedIndex].location.lat,
              widget.pois[_currentSelectedIndex].location.lon),
      enableDoubleTapZooming: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _mapController.dispose();
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _cardHeight = (MediaQuery.of(context).orientation == Orientation.landscape)
        ? 90
        : 110;
    _pageViewController = PageController(
        initialPage: _currentSelectedIndex,
        viewportFraction:
            (MediaQuery.of(context).orientation == Orientation.landscape)
                ? 0.7
                : 0.8);
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            'assets/images/maps_grid.png',
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
              initialMarkersCount: widget.pois.length,
              tooltipSettings: const MapTooltipSettings(
                color: Colors.transparent,
              ),
              markerTooltipBuilder: (BuildContext context, int index) {
                return const SizedBox();
              },
              sublayers: <MapSublayer>[
                MapPolylineLayer(polylines: <MapPolyline>{
                  MapPolyline(
                    points: widget.hike.route.coordinates
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
                  latitude: widget.pois[index].location.lat,
                  longitude: widget.pois[index].location.lon,
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
              itemCount: widget.pois.length,
              onPageChanged: _handlePageChange,
              controller: _pageViewController,
              itemBuilder: (BuildContext context, int index) {
                final item = widget.pois[index];
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
                                    item.description?[0].summary ?? '',
                                    style: const TextStyle(fontSize: 11),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines:
                                        (index == 2 || index == 6) ? 2 : 4,
                                  ))
                                ],
                              ),
                            )),
                            // Adding Image for card.

                            Consumer(builder: (c, ref, _child) {
                              final imagesOfPoi =
                                  ref.watch(imagesOfPoiProvider(item.id));

                              return ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  child: SizedBox(
                                      height: _cardHeight - 10,
                                      width: _cardHeight - 10,
                                      child: imagesOfPoi.when(
                                          loading: () =>
                                              PoiIcon(poiType: item.poiType),
                                          error: (_err, _val) =>
                                              PoiIcon(poiType: item.poiType),
                                          data: (imageUrls) => imageUrls.isEmpty
                                              ? PoiIcon(poiType: item.poiType)
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              imageUrls.first),
                                                          fit: BoxFit
                                                              .cover))))));
                            }),
                          ])),
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
          widget.pois[_currentSelectedIndex].location.lat,
          widget.pois[_currentSelectedIndex].location.lon);
    }

    /// Updating the design of the selected marker. Please check the
    /// `markerBuilder` section in the build method to know how this is done.
    _mapController
        .updateMarkers(<int>[_currentSelectedIndex, _previousSelectedIndex]);
    _canUpdateFocalLatLng = true;
  }
}
