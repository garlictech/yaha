// ignore: file_names
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:yaha/domain/domain.dart' as domain;
import 'package:yaha/ui/views/map/hike_overview_map.dart';
import 'package:yaha/ui/views/shared/section_title.dart';

import '../../../app/providers.dart';
import '../../../domain/domain.dart';
import '../poi/poi.dart';
import '../poi/poi_icon_list.dart';
import '../shared/shared.dart';
import '../shared/widgets/yaha-image.dart';
import '../utils/error-utils.dart';
import '../hikes/hike_properties.dart';
//import 'weather-screen.dart';

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
        onTap: () => debugPrint('FIRST CHILD'),
        onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: const Icon(Icons.comment_rounded, color: YahaColors.accentColor),
        onTap: () => debugPrint('SECOND CHILD'),
        onLongPress: () => debugPrint('SECOND CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child:
            const Icon(Icons.bookmark_rounded, color: YahaColors.accentColor),
        onTap: () => debugPrint('THIRD CHILD'),
        onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child:
            const Icon(Icons.download_rounded, color: YahaColors.accentColor),
        onTap: () => debugPrint('THIRD CHILD'),
        onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
      ),
    ],
  );
}

class HikeScreen extends ConsumerWidget {
  final String hikeId;
  const HikeScreen({Key? key, required this.hikeId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaults = ref.watch(defaultsProvider);
    final hikeSettings = ref.watch(hikingSettingsServiceProvider(hikeId));
    final hike = ref.watch(cachedHikeProvider(hikeId));
    final timeText =
        "Start time: ${hikeSettings.startTime.day}/${hikeSettings.startTime.month}, ${hikeSettings.startTime.hour}:${hikeSettings.startTime.minute.toString().padLeft(2, '0')}";

    return Scaffold(
        body: hike.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),

      data: (hike) {
        if (hike == null) {
          const Text('Oops, something unexpected happened');
        }
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            YahaSliverAppBar(
                title: hike!.descriptions.first.title ?? '',
                content: Stack(
                  children: [
                    if (hike.mainImageUrl != null)
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1000),
                        child: YahaImage(
                            key: UniqueKey(), imageUrl: hike.mainImageUrl!),
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
                )),
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
                                summary:
                                    hike.descriptions.first.summary ?? '')),
                        Padding(
                            padding: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.large),
                            child: ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.watch_rounded,
                                  size: YahaFontSizes.large,
                                ),
                                onPressed: () {
                                  DatePicker.showDateTimePicker(
                                    context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    onConfirm: (date) {
                                      ref
                                          .read(hikingSettingsServiceProvider(
                                                  hike.id)
                                              .notifier)
                                          .setStartTime(date);
                                    },
                                    currentTime: DateTime.now(),
                                  );
                                },
                                label: Text(timeText))),
                        Container(
                            margin: const EdgeInsets.only(
                                bottom: YahaSpaceSizes.large),
                            height: YahaBoxSizes.heightMedium,
                            width: MediaQuery.of(context).size.width,
                            child: GalleryWidget(
                                key: UniqueKey(),
                                imageUrls: hike.imageCardUrls)),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: YahaSpaceSizes.small),
                            child: HikeProperties(
                                hike: hike,
                                averageSpeedKmh: defaults.averageSpeedKmh)),
                        const SectionTitle(title: 'Things on route'),
                        Consumer(builder: (c, ref, child) {
                          return ref.watch(poisAlongHikeProvider(hike.id)).when(
                              loading: () => const Center(
                                  child: YahaProgressIndicator(
                                      text: "Searching for things...")),
                              error: errorWidget,
                              data: (pois) => PoiIconList(
                                  types: PoiUtils.uniqueTypes(pois),
                                  hike: hike));
                        }),
                        const SectionTitle(
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
                                .watch(randomTouristicPoisAlongHikeProvider(
                                    hike.id))
                                .when(
                                    loading: () => const Center(
                                        child: YahaProgressIndicator(
                                            text: "Searching for places...")),
                                    error: errorWidget,
                                    data: (pois) => PoiTitleList(pois: pois));
                          }),
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                                top: YahaSpaceSizes.small),
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
                          child: HikeOverviewMap(hikeId: hike.id),
                          //),
                        ),
                        /*const SectionTitle(title: 'Weather'),
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
                      */
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        );
      },
      //floatingActionButton: buildSpeedDial(),
    ));
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
        size: YahaFontSizes.large,
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute<dynamic>(builder: (BuildContext context) {
          return PlacesOnRouteScreen(hike: hike);
        }));
      },
      label: const Text('Hike outline',
          style: TextStyle(
            fontSize: YahaFontSizes.small,
            fontWeight: FontWeight.w600,
          )),
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(YahaBorderRadius.general))),
      ),
    );
  }
}

class HikeScreenStartHikeButton extends ConsumerWidget {
  const HikeScreenStartHikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.play_circle_rounded,
        size: YahaFontSizes.large,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => const SuccessPopup(
                title: "Start hike",
                content:
                    "You could start your activity now. This feature is coming soon, stay tuned!",
                buttonTitle: "I see"));
      },
      label: const Text('Start hike',
          style: TextStyle(
            fontSize: YahaFontSizes.small,
            fontWeight: FontWeight.w600,
          )),
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(YahaBorderRadius.general))),
      ),
    );
  }
}
