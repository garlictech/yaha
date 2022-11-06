import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/ui/views/hikes/map/widgets/leaflet-map.dart';
import 'package:yaha/domain/domain.dart' as domain;

import '../../shared/shared.dart';
import '../widgets/poi-icon.dart';

class WeatherInfoScreen extends ConsumerWidget {
  final domain.WeatherPoiOfHike poi;

  const WeatherInfoScreen({Key? key, required this.poi}) : super(key: key);

  static const imageKey = {"clouds": 'clouds.jpeg'};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          YahaSliverAppBar(
              title: poi.title,
              content: Image.asset(
                  'assets/weather-images/${imageKey[poi.poiType.kind]}',
                  fit: BoxFit.cover)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: YahaSpaceSizes.general,
                      right: YahaSpaceSizes.general),
                  child: Column(
                    children: [
                      Visibility(
                        visible: false,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: PoiIcon(poiType: poi.poiType),
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: InfoText(
                              text:
                                  "This screen shows either the first known weather condition during your hike, or an approximate weather change.")),
                      const YahaSectionTitle(text: "Location"),
                      const InfoText(
                          text:
                              "The location is the estimated location during the course of your hike, in the time of the weather report."),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: LocationTextInfo(geoPoint: poi.geoPoint)),
                      Container(
                        height: 340,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                          bottom: YahaSpaceSizes.general,
                        ),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(YahaBorderRadius.general),
                            child: LeafletMap(
                              poiMarkerBuilder: _markerBuilder,
                              pois: [poi],
                            )),
                      ),
                      const YahaSectionTitle(text: "Conditions"),
                      Row(children: [
                        const Text("Condition"),
                        Text(poi.weather.type)
                      ]),
                      Row(children: [
                        const Text("Time"),
                        Text(poi.weather.when.toString())
                      ])
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  get _markerBuilder {
    return (BuildContext context, domain.Poi poi, int index) {
      const double markerSize = 40;
      return Marker(
          point: LatLng(poi.geoPoint.latitude, poi.geoPoint.longitude),
          builder: (BuildContext c) {
            return SizedBox(
                height: markerSize,
                width: markerSize,
                child: PhysicalModel(
                    color: Colors.black,
                    shadowColor: Colors.black,
                    elevation: 8.0,
                    shape: BoxShape.circle,
                    child: PoiIcon(poiType: poi.poiType)));
          });
    };
  }
}
