import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/use-cases/hike/cached_hike.dart';

import '../shared/shared.dart';
import '../shared/widgets/yaha-image.dart';
import '../utils/error-utils.dart';
import '../screens/hike_screen.dart';

class HikeCard extends ConsumerWidget {
  final int? distanceFromCurrentLocation;
  final String hikeId;

  const HikeCard({
    Key? key,
    required this.hikeId,
    this.distanceFromCurrentLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: ClipRRect(
            borderRadius: BorderRadius.circular(YahaBorderRadius.general),
            child: Consumer(builder: (c, ref, child) {
              return ref.watch(cachedHikeProvider(hikeId)).when(
                    loading: () => const Center(
                        child: YahaProgressIndicator(text: "Loading hike...")),
                    error: errorWidget,
                    data: (hike) => hike == null
                        ? Container()
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HikeScreen(hike: hike)));
                            },
                            child: Stack(
                              children: [
                                if (hike.mainImageUrl != null)
                                  Align(
                                      alignment: Alignment.center,
                                      child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.35),
                                              BlendMode.darken),
                                          child: AnimatedSwitcher(
                                            duration: const Duration(
                                                milliseconds: 1500),
                                            child: YahaImage(
                                                key: UniqueKey(),
                                                imageUrl: hike.mainImageUrl!),
                                          ))),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    color: hike.images.isNotEmpty
                                        ? Colors.transparent
                                        : Colors.black87,
                                    padding: const EdgeInsets.only(
                                      left: YahaSpaceSizes.small,
                                      right: YahaSpaceSizes.small,
                                      bottom: YahaSpaceSizes.small,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          (hike.descriptions[0].title ??
                                              'A nice hike'),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        if (hike.route.municipality != null)
                                          Container(
                                              color: YahaColors.lightGreen
                                                  .withOpacity(.4),
                                              margin:
                                                  const EdgeInsets.only(top: 4),
                                              child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                        Icons.location_pin,
                                                        size: YahaFontSizes
                                                            .xSmall,
                                                        color: YahaColors
                                                            .background),
                                                    Text(
                                                      hike.route.municipality!
                                                          .toUpperCase(),
                                                      style: const TextStyle(
                                                        fontSize: YahaFontSizes
                                                            .xSmall,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: YahaColors
                                                            .background,
                                                      ),
                                                    )
                                                  ])),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
            })));
  }
}
