import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/views/poi/widgets/poi-icon.dart';
import 'package:yaha/domain/entities/entities.dart';
import 'package:yaha/providers/providers.dart';

class PoiListItem extends ConsumerWidget {
  final Poi poi;
  final double cardHeight;

  const PoiListItem({Key? key, required this.poi, required this.cardHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesOfPoi = ref.watch(imagesOfPoiProvider(poi.id));

    final summary = poi.description?[0].summary == null
        ? const Text("No description yet")
        : (poi.description?[0].type == 'html'
            ? Html(data: poi.description?[0].summary)
            : Markdown(data: poi.description?[0].summary ?? ''));

    return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Adding title and description for card.
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 5.0),
            child: Column(
              children: [
                Row(
                    children: imagesOfPoi.when(
                        error: (_e, _s) => [
                              Text(poi.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.start)
                            ],
                        loading: () => [
                              Text(poi.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.start)
                            ],
                        data: (imageUrls) => imageUrls.isEmpty
                            ? [
                                Text(poi.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    textAlign: TextAlign.start)
                              ]
                            : [
                                Container(
                                    height: 30,
                                    width: 30,
                                    padding: const EdgeInsets.only(right: 4),
                                    child: PoiIcon(poiType: poi.poiType)),
                                Text(poi.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    textAlign: TextAlign.start)
                              ])),
                const SizedBox(height: 5),
                Expanded(child: summary)
              ],
            ),
          )),
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: SizedBox(
                  height: cardHeight - 10,
                  width: cardHeight - 10,
                  child: imagesOfPoi.when(
                      loading: () => PoiIcon(poiType: poi.poiType),
                      error: (_err, _val) => PoiIcon(poiType: poi.poiType),
                      data: (imageUrls) => imageUrls.isEmpty
                          ? PoiIcon(poiType: poi.poiType)
                          : Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageUrls.first),
                                      fit: BoxFit.cover))))))
        ]);
  }
}
