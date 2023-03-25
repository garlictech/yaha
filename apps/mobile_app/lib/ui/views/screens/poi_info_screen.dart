import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart' as domain;
import 'package:yaha/domain/entities/poi/poi_entity.dart';
import 'package:yaha/ui/views/map/poi_info_map.dart';

import '../shared/shared.dart';

class LocationLine extends StatelessWidget {
  final String label;
  final num value;

  const LocationLine({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
            fontSize: YahaFontSizes.small, color: YahaColors.textColor),
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: '${(value * 100000).round() / 100000}',
          ),
        ],
      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  final Poi poi;

  const LocationInfo({super.key, required this.poi});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Padding(
          padding: EdgeInsets.only(right: YahaSpaceSizes.small),
          child: Icon(Icons.location_on_outlined)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationLine(label: "Latitude", value: poi.geoPoint.latitude),
          Padding(
            padding: const EdgeInsets.only(
                top: YahaSpaceSizes.small, bottom: YahaSpaceSizes.small),
            child:
                LocationLine(label: "Longitude", value: poi.geoPoint.longitude),
          ),
          poi.geoPoint.height != null
              ? LocationLine(label: "Elevation", value: poi.geoPoint.height)
              : Container(),
        ],
      )
    ]);
  }
}

class PoiInfoScreen extends ConsumerWidget {
  final domain.Poi poi;
  final domain.Hike hike;
  const PoiInfoScreen({Key? key, required this.poi, required this.hike})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const noDesc = Text(
      "No description yet",
      style:
          TextStyle(color: YahaColors.textColor, fontSize: YahaFontSizes.small),
    );

    final summary = (poi.descriptions?.isNotEmpty ?? false)
        ? poi.descriptions!.first.summary == null
            ? noDesc
            : (poi.descriptions!.first.type == 'html'
                ? Html(data: poi.descriptions!.first.summary)
                : Markdown(data: poi.descriptions!.first.summary ?? ''))
        : noDesc;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          YahaSliverAppBar(
              title: poi.title,
              content: poi.imageCardUrls.isEmpty
                  ? Image.asset('assets/images/default_poi_header.jpg',
                      fit: BoxFit.cover)
                  : Image.network(poi.imageCardUrls.first, fit: BoxFit.cover)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.general,
                            bottom: YahaSpaceSizes.general,
                            left: YahaSpaceSizes.small,
                            right: YahaSpaceSizes.small),
                        child: summary),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: LocationInfo(poi: poi)),
                    Container(
                      height: 340,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                          bottom: YahaSpaceSizes.general,
                          top: YahaSpaceSizes.general),
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                          child: PoiInfoMap(poi: poi, hikeId: hike.id)),
                    ),
                    /*Container(
                      padding:
                          const EdgeInsets.only(bottom: YahaSpaceSizes.medium),
                      child: Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                  right: YahaSpaceSizes.small),
                              child: const Icon(Icons.schedule_outlined)),
                          const Text('Open',
                              style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w500,
                              )),
                          const Text(' - closing: 18:00',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w400,
                                  color: YahaColors.textColor)),
                          RotatedBox(
                            quarterTurns: 0,
                            child: GestureDetector(
                                onTap: () {},
                                child: const Icon(Icons.expand_more)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: YahaSpaceSizes.general),
                      child: Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                  right: YahaSpaceSizes.small),
                              child: const Icon(Icons.call)),
                          const Text('(06 1) 338 2122',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w400,
                                  color: YahaColors.textColor)),
                        ],
                      ),
                    ),*/
                    poi.imageCardUrls.isEmpty
                        ? Container()
                        : Container(
                            margin: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.large),
                            height: YahaBoxSizes.heightMedium,
                            width: MediaQuery.of(context).size.width,
                            child: GalleryWidget(imageUrls: poi.imageCardUrls)),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: YahaSpaceSizes.xLarge,
                          bottom: YahaSpaceSizes.general),
                      child: SizedBox(
                        height: YahaBoxSizes.buttonHeight,
                        width: YahaBoxSizes.buttonWidthBig,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.add,
                            size: YahaFontSizes.large,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => const SuccessPopup(
                                    title: "Future feature",
                                    content:
                                        "You will be able to add the POI to the alert list of the hike. Stay tuned.",
                                    buttonTitle: "Cool"));
                          },
                          label: const Text('Add to hike',
                              style: TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                              )),
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
