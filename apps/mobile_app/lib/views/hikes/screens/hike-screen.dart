// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/entities/hike/hike.dart';
import 'package:yaha/entities/shared/geojson.dart';
import 'package:yaha/gallery.dart';
import 'package:yaha/hike/hike-outline/hike-outline-screen.dart';
import 'package:yaha/hike/hike-outline/poi.dart';
import 'package:yaha/hike/hike-outline/settings/poi-filters.dart';
import 'package:yaha/hike/hike-screen/most-interesting-place-on-route/places-on-route-screen.dart';
import 'package:yaha/hike/views/screens/more-poi-screen.dart';
import 'package:yaha/hike/views/screens/weather-screen.dart';
import 'package:yaha/presenters/map/leaflet-map-presenter.dart';
import 'package:yaha/utility/buttons/show-more-button.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-icon-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';
import 'package:yaha/views/map/widgets/leaflet-map.dart';

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

class HikeScreen extends ConsumerWidget {
  final Hike hike;

  const HikeScreen({Key? key, required this.hike}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final presenter = watch(leafletMapMVPProvider.notifier);

    if (hike.route != null) {
      presenter.addHikeTrack(hike.route as GeoJsonData);
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
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
                        hike.description?.first.title ?? '',
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
                      image: NetworkImage(hike.imageUrls?.first ??
                          'https://cdn2.iconfinder.com/data/icons/mountain-landscape-2/138/hiking_boots_hiking_logo_hiking_chair_hiking_drawing_hiking_day_hiking_flyer_hiking_in_winter-1024.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
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
                      SizedBox(
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
                                borderRadius: BorderRadius.all(
                                    Radius.circular(YahaBorderRadius.general))),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.general,
                            bottom: YahaSpaceSizes.general),
                        child: Text(hike.description?.first.summary ?? '',
                            style: const TextStyle(
                                fontSize: YahaFontSizes.small,
                                fontWeight: FontWeight.w400,
                                color: YahaColors.textColor)),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              bottom: YahaSpaceSizes.large),
                          height: YahaBoxSizes.heightMedium,
                          width: MediaQuery.of(context).size.width,
                          child: Gallery(imageUrls: hike.imageUrls)),
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.only(
                          bottom: YahaSpaceSizes.general,
                        ),
                        crossAxisSpacing: YahaSpaceSizes.medium,
                        mainAxisSpacing: YahaSpaceSizes.medium,
                        crossAxisCount: 3,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(YahaSpaceSizes.small),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.hiking_rounded,
                                    size: YahaIconSizes.large,
                                    color: YahaColors.secondaryAccentColor),
                                Text("24.3km",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            YahaColors.secondaryAccentColor)),
                                Text("Distance",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            YahaColors.secondaryAccentColor)),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                border: Border.all(
                                    width: 4.0,
                                    color: YahaColors.secondaryAccentColor)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(YahaSpaceSizes.small),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.trending_up_rounded,
                                    size: YahaIconSizes.large,
                                    color: YahaColors.secondaryAccentColor),
                                Text("576m",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            YahaColors.secondaryAccentColor)),
                                Text("Uphill",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            YahaColors.secondaryAccentColor)),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                border: Border.all(
                                    width: 4.0,
                                    color: YahaColors.secondaryAccentColor)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(YahaSpaceSizes.small),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.trending_down_rounded,
                                    size: YahaIconSizes.large,
                                    color: YahaColors.secondaryAccentColor),
                                Text("1.2km",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            YahaColors.secondaryAccentColor)),
                                Text("Downhill",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            YahaColors.secondaryAccentColor)),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                border: Border.all(
                                    width: 4.0,
                                    color: YahaColors.secondaryAccentColor)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(YahaSpaceSizes.small),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.watch_later_rounded,
                                    size: YahaIconSizes.large,
                                    color: YahaColors.secondaryAccentColor),
                                Text("6h",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            YahaColors.secondaryAccentColor)),
                                Text("Time",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            YahaColors.secondaryAccentColor)),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                border: Border.all(
                                    width: 4.0,
                                    color: YahaColors.secondaryAccentColor)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(YahaSpaceSizes.small),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.emoji_events_rounded,
                                    size: YahaIconSizes.large,
                                    color: YahaColors.secondaryAccentColor),
                                Text("240",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            YahaColors.secondaryAccentColor)),
                                Text("Points",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            YahaColors.secondaryAccentColor)),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                border: Border.all(
                                    width: 4.0,
                                    color: YahaColors.secondaryAccentColor)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(YahaSpaceSizes.small),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.stars_rounded,
                                    size: YahaIconSizes.large,
                                    color: YahaColors.secondary),
                                Text("Medium",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w600,
                                        color: YahaColors.secondary)),
                                Text("Difficulty",
                                    style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w500,
                                        color: YahaColors.secondary)),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    YahaBorderRadius.general),
                                border: Border.all(
                                    width: 4.0, color: YahaColors.secondary)),
                          ),
                        ],
                      ),
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
                        child: ShowMoreButton(nextScreen: MorePoiScreen()),
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
                                const Poi(
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
                                  const Poi(
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
                                  const Poi(
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
                          child: ShowMoreButton(
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
                      ShowMoreButton(nextScreen: WeatherScreen()),
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
                                return HikeOutlineScreen();
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
