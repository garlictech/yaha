import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/domain/domain.dart' as domain;
import 'package:yaha/app/image-providers.dart';

import '../../../shared/shared.dart';
import '../../../shared/widgets/yaha-image.dart';
import '../screens/hike_screen.dart';

class HikeCard extends ConsumerWidget {
  final int? distanceFromCurrentLocation;
  final domain.Hike hike;

  const HikeCard({
    Key? key,
    required this.hike,
    this.distanceFromCurrentLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(YahaBorderRadius.poiSmall),
        child: InkWell(
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
                      Colors.black.withOpacity(0.35), BlendMode.darken),
                  child: Consumer(builder: (c, ref, _child) {
                    final imageUrl = ref.watch(
                        imagesAlongHikeNotifierProvider(hike.id)
                            .select((vm) => vm.firstImageUrl));

                    return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1500),
                        child: YahaImage(key: UniqueKey(), imageUrl: imageUrl));
                  }),
                ),
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
                        hike.description[0].title ?? 'A nice hike',
                        style: const TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w700,
                          color: YahaColors.background,
                        ),
                      ),
                      Text(
                        hike.closestPlace ?? '',
                        style: const TextStyle(
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
      ),
    );
  }
}
