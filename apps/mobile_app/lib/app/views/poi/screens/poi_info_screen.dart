import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:yaha/domain/domain.dart' as domain;
import 'package:yaha/providers/providers.dart';

import '../../map/widgets/leaflet-map.dart';
import '../../shared/shared.dart';
import '../widgets/poi-icon.dart';

class PoiInfoScreen extends ConsumerWidget {
  final domain.Poi poi;
  final domain.Hike? hike;
  const PoiInfoScreen({Key? key, required this.poi, this.hike})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = poi.description?[0].summary == null
        ? const Text(
            "No description yet",
            style: TextStyle(
                color: YahaColors.textColor, fontSize: YahaFontSizes.small),
          )
        : (poi.description?[0].type == 'html'
            ? Html(data: poi.description?[0].summary)
            : Markdown(data: poi.description?[0].summary ?? ''));

    return Scaffold(
      appBar: AppBar(
        leading: const YahaBackButton(),
        backgroundColor: YahaColors.background,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(
              left: YahaSpaceSizes.general, right: YahaSpaceSizes.general),
          child: Text(
            poi.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: YahaFontSizes.medium,
              color: YahaColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: YahaSpaceSizes.small),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_outlined,
              ),
              iconSize: YahaIconSizes.medium,
              color: YahaColors.textColor,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          Consumer(builder: (c, ref, _child) {
            final imagesOfPoi = ref.watch(imagesOfPoiProvider(poi.id));
            poiIcon() =>
                SizedBox(height: 240, child: PoiIcon(poiType: poi.poiType));

            imageContent(imageUrl) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );

            return imagesOfPoi.when(
                error: (_e, _s) =>
                    YahaSliverAppBar(title: poi.title, content: poiIcon()),
                loading: () =>
                    YahaSliverAppBar(title: poi.title, content: poiIcon()),
                data: (imageUrls) => YahaSliverAppBar(
                    title: poi.title,
                    content: imageUrls.isEmpty
                        ? poiIcon()
                        : imageContent(imageUrls.first)));
          }),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                    child: Container(
                  padding: const EdgeInsets.only(
                      left: YahaSpaceSizes.general,
                      right: YahaSpaceSizes.general),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general,
                              bottom: YahaSpaceSizes.general),
                          child: SizedBox(
                              child: PoiIcon(poiType: poi.poiType),
                              height: 80,
                              width: 80)),
                      Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general),
                          child: summary),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    color: YahaColors.textColor),
                                children: [
                                  const TextSpan(
                                    text: 'Latitude: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text:
                                        '${(poi.location.lat * 100000).round() / 100000}',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.small,
                                  bottom: YahaSpaceSizes.small),
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      color: YahaColors.textColor),
                                  children: [
                                    const TextSpan(
                                      text: 'Longitude: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text:
                                          '${(poi.location.lon * 100000).round() / 100000}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            poi.elevation != null
                                ? RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                          fontSize: YahaFontSizes.small,
                                          color: YahaColors.textColor),
                                      children: [
                                        const TextSpan(
                                          text: 'Elevation: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        TextSpan(
                                          text: '${poi.elevation!.round()} m',
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Container(
                        height: 340,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.general,
                            top: YahaSpaceSizes.general),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(YahaBorderRadius.general),
                            child: LeafletMap(
                                mapKey: poi.id,
                                poiMarkerBuilder: _markerBuilder,
                                pois: [poi])),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.medium),
                        child: Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    right: YahaSpaceSizes.small),
                                child: const Icon(Icons.schedule_outlined)),
                            const Text('Open',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w400,
                                    color: YahaColors.primary)),
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
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.medium),
                        child: Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    right: YahaSpaceSizes.small),
                                child: const Icon(Icons.location_on_outlined)),
                            const Text('Opening hours',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w400,
                                    color: YahaColors.textColor)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.general),
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
                      ),
                      Consumer(builder: (c, ref, _child) {
                        final imagesOfPoi =
                            ref.watch(imagesOfPoiProvider(poi.id));
                        return imagesOfPoi.when(
                            error: (_e, _s) => Container(),
                            loading: () => const CircularProgressIndicator(),
                            data: (imageUrls) => imageUrls.isEmpty
                                ? Container()
                                : Container(
                                    margin: const EdgeInsets.only(
                                        bottom: YahaSpaceSizes.large),
                                    height: YahaBoxSizes.heightMedium,
                                    width: MediaQuery.of(context).size.width,
                                    child:
                                        GalleryWidget(imageUrls: imageUrls)));
                      }),
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
                              color: YahaColors.accentColor,
                              size: YahaFontSizes.large,
                            ),
                            onPressed: () {},
                            label: const Text('Add to hike',
                                style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w600,
                                )),
                            style: ElevatedButton.styleFrom(
                              primary: YahaColors.primary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          YahaBorderRadius.general))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
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
      const double _markerSize = 40;
      return Marker(
          point: LatLng(poi.location.lat, poi.location.lon),
          builder: (BuildContext _c) {
            return SizedBox(
                height: _markerSize,
                width: _markerSize,
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
