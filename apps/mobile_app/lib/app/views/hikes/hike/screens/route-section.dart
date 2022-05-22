import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import 'route-section-poi-list-preview.dart';

// We have to move these classes somewhere else
class RouteSectionModel {
  final String routeLengthInTime;
  final String routeLengthInTimeMetrics;
  final String routeLength;
  final String routeLengthMetrics;

  const RouteSectionModel({
    required this.routeLengthInTime,
    required this.routeLengthInTimeMetrics,
    required this.routeLength,
    required this.routeLengthMetrics,
  });
}

class RouteSection extends StatelessWidget {
  final RouteSectionModel routeSectionModel;

  const RouteSection({Key? key, required this.routeSectionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
/*      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MorePoiScreen()));
      },*/
      child: ClipRRect(
        borderRadius: BorderRadius.circular(YahaBorderRadius.general),
        child: Container(
          padding: const EdgeInsets.all(YahaSpaceSizes.small),
          constraints: const BoxConstraints(
            maxWidth: YahaBoxSizes.sectionWidthMax,
          ),
          height: YahaBoxSizes.sectionHeight,
          color: YahaColors.accentColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(right: YahaSpaceSizes.medium),
                    child: const Icon(
                      Icons.hiking_rounded,
                      size: YahaIconSizes.large,
                      color: YahaColors.textColor,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            bottom: YahaSpaceSizes.xxSmall),
                        child: Row(
                          children: [
                            Text(
                              routeSectionModel.routeLength,
                              style: const TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor,
                              ),
                            ),
                            Text(
                              routeSectionModel.routeLengthMetrics,
                              style: const TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w400,
                                color: YahaColors.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            routeSectionModel.routeLengthInTime,
                            style: const TextStyle(
                              fontSize: YahaFontSizes.small,
                              fontWeight: FontWeight.w600,
                              color: YahaColors.textColor,
                            ),
                          ),
                          Text(
                            routeSectionModel.routeLengthInTimeMetrics,
                            style: const TextStyle(
                              fontSize: YahaFontSizes.small,
                              fontWeight: FontWeight.w400,
                              color: YahaColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: YahaSpaceSizes.medium),
                    child: const RouteSectionPoiListPreview(),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: YahaIconSizes.medium,
                color: YahaColors.textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
