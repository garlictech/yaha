// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaha/app/presenters/map/leaflet-map-presenter.dart';
import 'package:yaha/domain/domain.dart';

import '../../../../providers/providers.dart';
import '../../map/widgets/leaflet-map.dart';
import '../../shared/shared.dart';
import '../widgets/poi-filters.dart';
import 'hike-outline-screen.dart';
import 'more-poi-screen.dart';
import 'places-on-route-screen.dart';
import 'poi-summary.dart';
import 'weather-screen.dart';

SpeedDial buildSpeedDial() {
  return SpeedDial(
    /// both default to 16
    marginEnd: 18,
    marginBottom: 720,
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
    buttonSize: 56.0,
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

    orientation: SpeedDialOrientation.Down,
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

class HikeScreenSliverAppBar extends StatelessWidget {
  final String title;
  final String imageUrl;

  const HikeScreenSliverAppBar(
      {required this.title, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: false,
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 240.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
            left: YahaSpaceSizes.general, bottom: YahaSpaceSizes.small),
        centerTitle: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: YahaColors.background,
                      fontWeight: FontWeight.w700,
                      fontSize: YahaFontSizes.small),
                ),
              ],
            ),
          ],
        ),
        background: ColorFiltered(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.20), BlendMode.darken),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                //image: NetworkImage(viewModel.imageUrls.first),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HikeScreenStartHikeButton extends StatelessWidget {
  const HikeScreenStartHikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: YahaBoxSizes.buttonHeight,
      width: YahaBoxSizes.buttonWidthBig,
      child: ElevatedButton.icon(
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
      ),
    );
  }
}

class HikeDataElement extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;
  final Color color;

  const HikeDataElement(
      {required this.title,
      required this.icon,
      required this.value,
      this.color = YahaColors.secondaryAccentColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(YahaSpaceSizes.small),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, size: YahaIconSizes.large, color: color),
          Text(value,
              style: TextStyle(
                  fontSize: YahaFontSizes.small,
                  fontWeight: FontWeight.w600,
                  color: color)),
          Text(title,
              style: TextStyle(
                  fontSize: YahaFontSizes.small,
                  fontWeight: FontWeight.w500,
                  color: color)),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(YahaBorderRadius.general),
          border: Border.all(width: 4.0, color: color)),
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

class HikeProperties extends StatelessWidget {
  final Hike hike;
  final double averageSpeedKmh;

  const HikeProperties(
      {required this.hike, required this.averageSpeedKmh, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.only(
        bottom: YahaSpaceSizes.general,
      ),
      crossAxisSpacing: YahaSpaceSizes.medium,
      mainAxisSpacing: YahaSpaceSizes.medium,
      crossAxisCount: 3,
      children: <Widget>[
        HikeDataElement(
            title: "Distance",
            icon: Icons.hiking_rounded,
            value: _distanceValue(hike.trailLength)),
        HikeDataElement(
            title: "Uphill",
            icon: Icons.trending_up_rounded,
            value: _distanceValue(hike.uphill)),
        HikeDataElement(
            title: "Downhill",
            icon: Icons.trending_down_rounded,
            value: _distanceValue(hike.downhill)),
        HikeDataElement(
            title: "Time",
            icon: Icons.watch_later_rounded,
            value: _timeValue(GameRules.estimatedTime(
                hike.trailLength, hike.uphill, averageSpeedKmh))),
        HikeDataElement(
            title: "Score",
            icon: Icons.emoji_events_rounded,
            value: hike.score.toString()),
        HikeDataElement(
            title: "Difficulty",
            icon: Icons.stars_rounded,
            value: _difficulty[1],
            color: _difficulty[0])
      ],
    );
  }

  _distanceValue(double distanceInMeters) {
    final value = distanceInMeters < 2000
        ? distanceInMeters.round()
        : (distanceInMeters / 100).round() / 10;

    final unit = distanceInMeters < 2000 ? 'm' : 'km';
    return '$value $unit';
  }

  _timeValue(double timeInMinutes) {
    final hours = timeInMinutes ~/ 60;
    final minutes = timeInMinutes.remainder(60).floor();

    String hoursTxt = hours == 0 ? '' : '${hours}h';
    hoursTxt += minutes == 0 ? '' : ' ';

    final minutesTxt = minutes == 0 ? '' : '${minutes}m';
    return '$hoursTxt$minutesTxt';
  }

  get _difficulty {
    const diffData = {
      0: [Colors.green, "Easy"],
      1: [Colors.orange, "Difficult"],
      2: [Colors.red, "Extreme"],
    };

    return diffData[hike.difficulty];
  }
}

class DistanceWidget extends StatelessWidget {
  final double distanceInMeters;
  final TextStyle? style;

  const DistanceWidget({Key? key, required this.distanceInMeters, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = distanceInMeters < 2000
        ? distanceInMeters.round()
        : (distanceInMeters * 10).round() / 10;
    return Text(value.toString(), style: style);
  }
}

class HikeScreen extends ConsumerWidget {
  final Hike hike;

  const HikeScreen({Key? key, required this.hike}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(leafletMapMVPProvider.notifier);
    final defaults = ref.watch(defaultsProvider);
    presenter.addHikeTrack(hike.route);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          Consumer(builder: (c, ref, _child) {
            final imageUrl = ref.watch(imagesAlongHikeNotifierProvider(hike.id)
                .select((vm) => vm.firstImageUrl));

            return HikeScreenSliverAppBar(
                title: hike.description.first.title ?? '', imageUrl: imageUrl);
          }),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: YahaSpaceSizes.general,
                    right: YahaSpaceSizes.general,
                    top: YahaSpaceSizes.general,
                  ),
                  child: Column(
                    children: [
                      const HikeScreenStartHikeButton(),
                      HikeScreenDescription(
                          summary: hike.description.first.summary ?? ''),
                      Container(
                          margin: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.large),
                          height: YahaBoxSizes.heightMedium,
                          width: MediaQuery.of(context).size.width,
                          child: Consumer(builder: (c, ref, _child) {
                            final imageUrls = ref.watch(
                                imagesAlongHikeNotifierProvider(hike.id)
                                    .select((vm) => vm.imageUrls));

                            return GalleryWidget(imageUrls: imageUrls);
                          })),
                      HikeProperties(
                          hike: hike,
                          averageSpeedKmh: defaults.averageSpeedKmh),
                      Container(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.small,
                            bottom: YahaSpaceSizes.small),
                        child: Column(
                          children: const [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Things on route',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: YahaSpaceSizes.medium,
                          runSpacing: YahaSpaceSizes.xSmall,
                          alignment: WrapAlignment.start,
                          children: const [
                            PoiFilters(
                              backgroundColor: YahaColors.generic,
                              icon: Icons.location_city_rounded,
                              title: "Generic",
                            ),
                            PoiFilters(
                              backgroundColor: YahaColors.amenity,
                              icon: Icons.fastfood_rounded,
                              title: "Amenity",
                            ),
                            PoiFilters(
                              backgroundColor: YahaColors.natural,
                              icon: Icons.park_rounded,
                              title: "Natural",
                            ),
                            PoiFilters(
                              backgroundColor: YahaColors.emergency,
                              icon: Icons.local_hospital_rounded,
                              title: "Emergency",
                            ),
                            PoiFilters(
                              backgroundColor: YahaColors.publicTransport,
                              icon: Icons.commute_rounded,
                              title: "Public Transport",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: YahaSpaceSizes.small,
                        ),
                        child:
                            const ShowMoreButton(nextScreen: MorePoiScreen()),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: YahaSpaceSizes.general,
                          bottom: YahaSpaceSizes.medium,
                        ),
                        child: Column(
                          children: const [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Most interesting places on route',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: YahaFontSizes.medium,
                                      fontWeight: FontWeight.w600,
                                      color: YahaColors.textColor)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(YahaSpaceSizes.general),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const PoiSummary(
                                  backgroundColor: YahaColors.generic,
                                  icon: Icons.location_city_rounded,
                                  iconSize: YahaIconSizes.small,
                                  padding: YahaSpaceSizes.xSmall,
                                  radius: 19,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: YahaSpaceSizes.small),
                                  child: const Text(
                                      "Hungarian Parliament Building",
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small,
                                          color: YahaColors.textColor)),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.medium),
                              child: Row(
                                children: [
                                  const PoiSummary(
                                    backgroundColor: YahaColors.generic,
                                    icon: Icons.museum,
                                    iconSize: YahaIconSizes.small,
                                    padding: YahaSpaceSizes.xSmall,
                                    radius: 19,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: YahaSpaceSizes.small),
                                    child: const Text(
                                        "Hungarian National Museum",
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            color: YahaColors.textColor)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.medium),
                              child: Row(
                                children: [
                                  const PoiSummary(
                                    backgroundColor: YahaColors.amenity,
                                    icon: Icons.pool_rounded,
                                    iconSize: YahaIconSizes.small,
                                    padding: YahaSpaceSizes.xSmall,
                                    radius: 19,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: YahaSpaceSizes.small),
                                    child: const Text("Széchenyi Thermal Bath",
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            color: YahaColors.textColor)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: YahaColors.accentColor,
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                        ),
                      ),
                      Container(
                          padding:
                              const EdgeInsets.only(top: YahaSpaceSizes.small),
                          child: const ShowMoreButton(
                            nextScreen: PlacesOnRouteScreen(),
                          )),
                      Container(
                          height: 340,
                          margin:
                              const EdgeInsets.only(top: YahaSpaceSizes.large),
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(YahaBorderRadius.general),
                            child: const LeafletMap(),
                          )),
                      Container(
                        padding:
                            const EdgeInsets.only(top: YahaSpaceSizes.large),
                        alignment: Alignment.centerLeft,
                        child: const Text('Weather',
                            style: TextStyle(
                                fontSize: YahaFontSizes.medium,
                                fontWeight: FontWeight.w600,
                                color: YahaColors.textColor)),
                      ),
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
                          ),
                          Container(
                            padding:
                                const EdgeInsets.all(YahaSpaceSizes.medium),
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
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(YahaSpaceSizes.small),
                            child: const Text(
                              'The day of your hike',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: YahaColors.textColor,
                                  fontSize: YahaFontSizes.small),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  YahaBorderRadius.general),
                              border: Border.all(
                                  width: YahaBorderWidth.small,
                                  color: YahaColors.textColor),
                            ),
                          ),
                        ],
                      ),
                      const ShowMoreButton(nextScreen: WeatherScreen()),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.large,
                            bottom: YahaSpaceSizes.general),
                        child: SizedBox(
                          height: YahaBoxSizes.buttonHeight,
                          width: YahaBoxSizes.buttonWidthBig,
                          child: ElevatedButton.icon(
                            icon: const Icon(
                              Icons.timeline,
                              color: YahaColors.accentColor,
                              size: YahaFontSizes.large,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) {
                                return const HikeOutlineScreen();
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
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          YahaBorderRadius.general))),
                            ),
                          ),
                        ),
                      ),
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
