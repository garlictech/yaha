import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/use-cases/hike/hike_provider.dart';

import '../../../shared/shared.dart';
import '../../../shared/widgets/yaha-image.dart';
import '../../../utils/error-utils.dart';
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
            borderRadius: BorderRadius.circular(YahaBorderRadius.xSmall),
            child: Consumer(builder: (c, ref, child) {
              return ref.watch(hikeProvider(hikeId)).when(
                    loading: () => const Center(
                        child: YahaProgressIndicator(text: "Loading hike...")),
                    error: errorWidget,
                    data: (hike) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HikeScreen(hike: hike)));
                      },
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.35),
                                    BlendMode.darken),
                                child: AnimatedSwitcher(
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    child: YahaImage(
                                        key: UniqueKey(),
                                        imageUrl: hike.images.first.card))),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: YahaSpaceSizes.small,
                                bottom: YahaSpaceSizes.small,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hike.descriptions[0].title ?? 'A nice hike',
                                    style: const TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w700,
                                      color: YahaColors.background,
                                    ),
                                  ),
                                  const Text(
                                    'Bivalybasznád',
                                    style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.background,
                                    ),
                                  ),
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
