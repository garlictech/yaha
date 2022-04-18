import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart' as domain;
import 'package:yaha/providers/providers.dart';

import '../../shared/shared.dart';
import '../widgets/poi-icon.dart';

class PoiInfoScreen extends ConsumerWidget {
  final domain.Poi poi;
  const PoiInfoScreen({Key? key, required this.poi}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
                        /*Container(
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.general,
                                bottom: YahaSpaceSizes.general),
                            child: const PoiSummary(
                              backgroundColor: YahaColors.generic,
                              icon: Icons.museum_rounded,
                              iconSize: 48,
                              padding: YahaSpaceSizes.small,
                              radius: 40,
                            )),
                        */
                        Container(
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general),
                          child: const Text(
                              'The Hungarian National Museum (Hungarian: Magyar Nemzeti Múzeum) was founded in 1802 and is the national museum for the history, art, and archaeology of Hungary.',
                              style: TextStyle(
                                  fontSize: YahaFontSizes.small,
                                  fontWeight: FontWeight.w400,
                                  color: YahaColors.textColor)),
                        ),
                        Container(
                          height: 340,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.general),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(YahaBorderRadius.general),
                            child: Image.asset(
                              'assets/images/poi_page.png',
                              fit: BoxFit.cover,
                            ),
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
                                  child:
                                      const Icon(Icons.location_on_outlined)),
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
}
