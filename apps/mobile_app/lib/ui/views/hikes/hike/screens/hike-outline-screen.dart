import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:yaha/domain/domain.dart' as domain;

import '/domain/domain.dart' as domain;
import '../../../shared/shared.dart';
import '../widgets/hike-outline-filters.dart';
import '../widgets/hike-outline-settings.dart';
import 'checkpoint.dart';
import 'hike-outline-state.dart';
import 'route-section.dart';
import 'timecapsule-on-hike-outline-widget.dart';
import 'weather-astronomical-data.dart';

class HikeOutlineScreen extends ConsumerWidget {
  final domain.Hike hike;
  const HikeOutlineScreen({Key? key, required this.hike}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pois =
        ref.watch(domain.touristicPoisAlongHikeWithYahaPoisProvider(hike.id));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: YahaColors.background,
          elevation: 0,
          title: const Text(
            'Hike Outline',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: YahaFontSizes.medium,
              color: YahaColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          leading: const YahaBackButton(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: YahaSpaceSizes.xSmall),
              child: IconButton(
                onPressed: () => showBarModalBottomSheet(
                  expand: false,
                  backgroundColor: YahaColors.background,
                  useRootNavigator: true,
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      controller: ModalScrollController.of(context),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: YahaSpaceSizes.small,
                              right: YahaSpaceSizes.medium,
                            ),
                            color: YahaColors.accentColor,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      primary: YahaColors.secondaryAccentColor,
                                    ),
                                    child: const Text("Reset"),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Customize hike outline",
                                    style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Icon(
                                      Icons.close_outlined,
                                      color: YahaColors.secondaryAccentColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: YahaColors.background,
                            child: const HikeOutlineFilters(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                icon: Image.asset(
                  'assets/images/filter-icon-filled.png',
                  width: 24.0,
                ),
              ),
            ),
            IconButton(
              onPressed: () => showBarModalBottomSheet(
                expand: false,
                backgroundColor: YahaColors.background,
                useRootNavigator: true,
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    controller: ModalScrollController.of(context),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: YahaSpaceSizes.small,
                            right: YahaSpaceSizes.medium,
                          ),
                          color: YahaColors.accentColor,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    primary: YahaColors.secondaryAccentColor,
                                  ),
                                  child: const Text("Reset"),
                                ),
                              ),
                              const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Customize hike",
                                  style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w600,
                                    color: YahaColors.textColor,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(
                                    Icons.close_outlined,
                                    color: YahaColors.secondaryAccentColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: YahaColors.background,
                          child: HikeOutlineSettings(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              icon: const Icon(
                Icons.settings_rounded,
                size: 28.0,
                color: YahaColors.textColor,
              ),
            ),
          ],
        ),
        body: pois.when(
            data: (pois) => _createMainWidget(pois),
            error: (err, s) =>
                const Center(child: Text("Something bad happened 😱")),
            loading: () => const Center(child: CircularProgressIndicator())));
  }

  _createMainWidget(List<domain.PoiOfHike> pois) {
    var nodes = pois.map((poi) {
      return Padding(
          padding: const EdgeInsets.only(bottom: YahaSpaceSizes.general),
          child: Checkpoint(
              /*checkpointModel: CheckpointModel(
            title: poi.title,
            boxBackgorundColor: YahaColors.generic,
            backgroundColor: YahaColors.generic,
            icon: PoiIcon(poiType: poi.poiType),
            iconSize: YahaIconSizes.xxLarge,
            estimatedArrival: "7:38",
            padding: YahaSpaceSizes.small,
            radius: YahaBoxSizes.circleAvatarRadiusLarge,*/
              poi: poi));
    });
    /*if (node is CheckpointModel) {
        return Checkpoint(checkpointModel: node);
      } else if (node is RouteSectionModel) {
        return RouteSection(routeSectionModel: node);
      } else if (node is DottedLine) {
        return DottedLine(
          direction: node.direction,
          lineLength: node.lineLength,
          lineThickness: node.lineThickness,
          dashRadius: node.dashRadius,
          dashGapLength: node.dashGapLength,
          dashColor: node.dashColor,
        );
      } else if (node is WeatherAstronomicalData) {
        return WeatherAstronomicalData(
          icon: node.icon,
          text: node.text,
        );
      } else if (node is TimeCapsuleOnHikeOutlineScreen) {
        return TimeCapsuleOnHikeOutlineScreen(
          text: node.text,
        );
      } else {
        throw "Wrong data";
      }
    });*/

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: YahaSpaceSizes.general),
                  child: Column(
                    children: [...nodes],
                  ),
                ),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
