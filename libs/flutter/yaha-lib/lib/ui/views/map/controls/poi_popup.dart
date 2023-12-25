import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_yaha_lib/domain/domain.dart' as domain;
import 'package:flutter_yaha_lib/domain/entities/hike/hike.dart';
import 'package:flutter_yaha_lib/ui/views/map/places_on_route_map_controller.dart';
import 'package:flutter_yaha_lib/ui/views/screens/poi_info_screen.dart';
import 'package:flutter_yaha_lib/ui/views/shared/widgets/yaha-image.dart';

class PoiPopup extends ConsumerWidget {
  final String poiId;
  final Hike hike;

  const PoiPopup({super.key, required this.poiId, required this.hike});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poi = ref.watch(domain.poiProvider(poiId));
    const popupSize = 200.0;

    onClose() {
      ref
          .read(placesOnRouteMapControllerProvider(hike.id).notifier)
          .hideAllModals();
    }

    return poi.when(
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => const Text("Cannot load poi"),
        data: (poi) {
          final titleText =
              poi.descriptions == null || poi.descriptions!.isEmpty
                  ? poi.kindAsStr
                  : poi.descriptions!.first.title ?? poi.kindAsStr;

          return Container(
              height: popupSize,
              width: popupSize,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 3, color: Theme.of(context).primaryColor),
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 12,
                    offset: const Offset(0, 3), // changes position of shadow
                  )
                ],
              ),
              child: Stack(children: [
                ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.45), BlendMode.darken),
                    child: ClipRRect(
                        child: YahaImage(
                            imageUrl: poi.imageCardUrls.isEmpty
                                ? null
                                : poi.imageCardUrls.first,
                            placeholderImagePath:
                                'packages/flutter_yaha_lib/assets/images/default_poi_popup_background.jpg'))),
                Container(
                    alignment: Alignment.topRight,
                    child: CloseButton(
                      color: Colors.red,
                      onPressed: onClose,
                    )),
                InkWell(
                    onTap: () {
                      onClose();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PoiInfoScreen(poi: poi, hike: hike)));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(titleText,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.white)),
                              if (poi.descriptions != null)
                                AutoSizeText(poi.kindAsStr,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(color: Colors.white))
                            ]))),
              ]));
        });
  }
}
