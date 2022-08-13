// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:yaha/domain/domain.dart' as domain;

import '../../../../../app/providers.dart';
import '../../../../../domain/domain.dart';
import '../../../poi/poi.dart';
import '../../../poi/widgets/poi_icon_list.dart';
import '../../../shared/shared.dart';
import '../../../shared/widgets/yaha-image.dart';
import '../../map/widgets/leaflet-map.dart';
import '../widgets/hike_properties.dart';
import 'hike-outline-screen.dart';
import 'weather-screen.dart';

SpeedDial buildSpeedDial() {
  return SpeedDial(
    /// both default to 16
    // animatedIcon: AnimatedIcons.menu_close,
    // animatedIconTheme: IconThemeData(size: 22.0),
    /// This is ignored if animatedIcon is non null
    icon: Icons.expand_more,
    activeIcon: Icons.chevron_left,
    // iconTheme: IconThemeData(color: YahaColors.secondaryAccentColor[50], size: 30),

    /// The label of the main button.
    // label: Text("Open Speed Dial"),
    /// The active label of the main button, Defaults to label if not specified.
    // activeLabel: Text("Close Speed Dial"),
    /// Transition Builder between label and activeLabel, defaults to FadeTransition.
    // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
    /// The below button size defaults to 56 itself, its the FAB size + It also affects relative padding and other elements
    buttonSize: const Size(56, 56),
    visible: true,

    /// If true user is forced to close dial manually
    /// by tapping main button and overlay is not rendered.
    closeManually: false,
    curve: Curves.easeInOut,
    overlayColor: YahaColors.textColor,
    overlayOpacity: 0.5,
    onOpen: () => debugPrint('OPENING DIAL'),
    onClose: () => debugPrint('DIAL CLOSED'),
    tooltip: 'Speed Dial',
    heroTag: 'speed-dial-hero-tag',
    backgroundColor: YahaColors.accentColor,
    foregroundColor: YahaColors.textColor,
    elevation: 8.0,
    shape: const CircleBorder(),

    direction: SpeedDialDirection.down,
    // childMarginBottom: 2,
    // childMarginTop: 2,
    // gradientBoxShape: BoxShape.rectangle,
    //gradient: LinearGradient(
    //begin: Alignment.topCenter,
    //end: Alignment.bottomCenter,
    //colors: [Colors.black, YahaColors.accentColor],
    //),
    children: [
      SpeedDialChild(
        child:
            const Icon(Icons.settings_rounded, color: YahaColors.accentColor),
        backgroundColor: YahaColors.primary,
        /*label: 'Settings',
        labelStyle: TextStyle(
            fontSize: YahaFontSizes.small, color: YahaColors.textColor),*/
        onTap: () => debugPrint('FIRST CHILD'),
        onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: const Icon(Icons.comment_rounded, color: YahaColors.accentColor),
        backgroundColor: YahaColors.primary,
        /*label: 'Comment',
        labelStyle: TextStyle(
            fontSize: YahaFontSizes.small, color: YahaColors.textColor),*/
        onTap: () => debugPrint('SECOND CHILD'),
        onLongPress: () => debugPrint('SECOND CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child:
            const Icon(Icons.bookmark_rounded, color: YahaColors.accentColor),
        backgroundColor: YahaColors.primary,
        /*label: 'Bookmark',
        labelStyle: TextStyle(fontSize: YahaFontSizes.small),*/
        onTap: () => debugPrint('THIRD CHILD'),
        onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child:
            const Icon(Icons.download_rounded, color: YahaColors.accentColor),
        backgroundColor: YahaColors.primary,
        /*label: 'Download',
        labelStyle: TextStyle(
            fontSize: YahaFontSizes.small, color: YahaColors.textColor),*/
        onTap: () => debugPrint('THIRD CHILD'),
        onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
      ),
    ],
  );
}

class HikeScreen extends ConsumerWidget {
  final domain.Hike hike;
  const HikeScreen({Key? key, required this.hike}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaults = ref.watch(defaultsProvider);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          Consumer(builder: (c, ref, child) {
            final imageUrl = ref.watch(imagesAlongHikeNotifierProvider(hike.id)
                .select((vm) => vm.firstImageUrl));
            final content = Stack(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: YahaImage(key: UniqueKey(), imageUrl: imageUrl),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.2),
                        ]),
                  ),
                ),
              ],
            );
            return YahaSliverAppBar(
                title: hike.description.first.title ?? '', content: content);
          }),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(
                    top: YahaSpaceSizes.general,
                  ),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const HikeScreenStartHikeButton(),
                            HikeScreenShowOutlineButton(hike: hike)
                          ]),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: YahaSpaceSizes.small),
                          child: HikeScreenDescription(
                              summary: hike.description.first.summary ?? '')),
                      Container(
                          margin: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.large),
                          height: YahaBoxSizes.heightMedium,
                          width: MediaQuery.of(context).size.width,
                          child: Consumer(builder: (c, ref, child) {
                            final imageUrls = ref.watch(
                                imagesAlongHikeNotifierProvider(hike.id)
                                    .select((vm) => vm.imageUrls));

                            return GalleryWidget(
                                key: UniqueKey(), imageUrls: imageUrls);
                          })),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: YahaSpaceSizes.small),
                          child: HikeProperties(
                              hike: hike,
                              averageSpeedKmh: defaults.averageSpeedKmh)),
                      const HikeScreenSectionTitle(title: 'Things on route'),
                      Consumer(builder: (c, ref, child) {
                        return ref.watch(poisAlongHikeProvider(hike.id)).when(
                            loading: () => const Center(
                                child: YahaProgressIndicator(
                                    text: "Searching for things...")),
                            error: (e, s) =>
                                const Text("Something bad happened"),
                            data: (pois) => PoiIconList(
                                types: PoiUtils.uniqueTypes(pois), hike: hike));
                      }),
                      const HikeScreenSectionTitle(
                          title: 'Some interesting places on route'),
                      Container(
                        padding: const EdgeInsets.all(YahaSpaceSizes.general),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: YahaColors.accentColor,
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                        ),
                        child: Consumer(builder: (c, ref, child) {
                          return ref
                              .watch(
                                  randomTouristicPoisAlongHikeProvider(hike.id))
                              .when(
                                  loading: () => const Center(
                                      child: YahaProgressIndicator(
                                          text: "Searching for places...")),
                                  error: (e, s) => const Center(
                                      child: Text("Something bad happened")),
                                  data: (pois) => PoiTitleList(pois: pois));
                        }),
                      ),
                      Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.small),
                          child: ShowMoreButton(
                            nextScreen: PlacesOnRouteScreen(hike: hike),
                          )),
                      Container(
                        padding:
                            const EdgeInsets.only(top: YahaSpaceSizes.large),
                        height: 340,
                        width: MediaQuery.of(context).size.width,
                        /*child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(YahaBorderRadius.general),*/
                        child: LeafletMap(hikes: [hike], pois: const []),
                        //),
                      ),
                      const HikeScreenSectionTitle(title: 'Weather'),
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.medium,
                            bottom: YahaSpaceSizes.small),
                        crossAxisSpacing: YahaSpaceSizes.general,
                        crossAxisCount: 3,
                        children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.all(YahaSpaceSizes.medium),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.red.shade300,
                                    Colors.orange.shade300,
                                  ],
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Wed',
                                  style:
                                      TextStyle(fontSize: YahaFontSizes.small),
                                ),
                                const Icon(Icons.wb_sunny,
                                    size: YahaFontSizes.xLarge,
                                    color: Colors.yellow),
                                RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                        color: YahaColors.textColor,
                                        fontSize: YahaFontSizes.small),
                                    children: [
                                      TextSpan(
                                        text: '19 ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '| 12',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.all(YahaSpaceSizes.medium),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.green.shade100,
                                    Colors.blue.shade200,
                                  ],
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Wed',
                                  style:
                                      TextStyle(fontSize: YahaFontSizes.small),
                                ),
                                const Icon(Icons.cloud,
                                    size: YahaFontSizes.xLarge,
                                    color: YahaColors.accentColor),
                                RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                        color: YahaColors.textColor,
                                        fontSize: YahaFontSizes.small),
                                    children: [
                                      TextSpan(
                                        text: '19 ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '| 12',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(YahaSpaceSizes.small),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.general),
                              border: Border.all(
                                  width: YahaBorderWidth.small,
                                  color: YahaColors.textColor),
                            ),
                            child: const Text(
                              'The day of your hike',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: YahaColors.textColor,
                                  fontSize: YahaFontSizes.small),
                            ),
                          ),
                        ],
                      ),
                      const ShowMoreButton(nextScreen: WeatherScreen()),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
      floatingActionButton: buildSpeedDial(),
    );
  }
}

class HikeScreenDescription extends StatelessWidget {
  final String summary;

  const HikeScreenDescription({this.summary = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: YahaSpaceSizes.general, bottom: YahaSpaceSizes.general),
      child: Text(summary,
          style: const TextStyle(
              fontSize: YahaFontSizes.small,
              fontWeight: FontWeight.w400,
              color: YahaColors.textColor)),
    );
  }
}

class HikeScreenShowOutlineButton extends StatelessWidget {
  final domain.Hike hike;
  const HikeScreenShowOutlineButton({Key? key, required this.hike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.timeline,
        color: YahaColors.accentColor,
        size: YahaFontSizes.large,
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute<dynamic>(builder: (BuildContext context) {
          return HikeOutlineScreen(hike: hike);
        }));
      },
      label: const Text('Hike outline',
          style: TextStyle(
            fontSize: YahaFontSizes.small,
            fontWeight: FontWeight.w600,
          )),
      style: ElevatedButton.styleFrom(
        primary: YahaColors.primary,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(YahaBorderRadius.general))),
      ),
    );
  }
}

class HikeScreenStartHikeButton extends StatelessWidget {
  const HikeScreenStartHikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.play_circle_rounded,
        color: YahaColors.accentColor,
        size: YahaFontSizes.large,
      ),
      onPressed: () {},
      label: const Text('Start hike',
          style: TextStyle(
            fontSize: YahaFontSizes.small,
            fontWeight: FontWeight.w600,
          )),
      style: ElevatedButton.styleFrom(
        primary: YahaColors.primary,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(YahaBorderRadius.general))),
      ),
    );
  }
}

class HikeScreenSectionTitle extends StatelessWidget {
  final String title;
  const HikeScreenSectionTitle({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
          left: YahaSpaceSizes.small,
          right: YahaSpaceSizes.small,
          top: YahaSpaceSizes.large,
          bottom: YahaSpaceSizes.small),
      child: Text(title,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: YahaFontSizes.medium,
              fontWeight: FontWeight.w600,
              color: YahaColors.textColor)),
    );
  }
}
