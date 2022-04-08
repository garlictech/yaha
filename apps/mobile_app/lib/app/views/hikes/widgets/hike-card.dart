import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/presenters/hike/hike-card-presenter.dart';
import 'package:yaha/domain/domain.dart' as domain;

import '../../shared/shared.dart';
import '../screens/hike-screen.dart';

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
    final viewModel = ref.watch(hikeCardPresenter(hike));

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
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(viewModel.mainHikeImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
                        hike.description?[0].title ?? 'A nice hike',
                        style: const TextStyle(
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w700,
                          color: YahaColors.background,
                        ),
                      ),
                      Text(
                        '($distanceFromCurrentLocation km away)',
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
