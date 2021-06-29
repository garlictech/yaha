//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mobile_app/gallery.dart';
import 'package:mobile_app/yaha-border-radius.dart';
import 'package:mobile_app/yaha-colors.dart';
import 'package:mobile_app/yaha-font-sizes.dart';
import 'package:mobile_app/yaha-space-sizes.dart';

class HikePage extends StatefulWidget {
  @override
  _HikePageState createState() => _HikePageState();
}

class _HikePageState extends State<HikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              expandedHeight: 240.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 60.0, bottom: 8.0),
                centerTitle: false,
                title: Container(
                  // child: Flexible(
                  //   flex: 1,
                  child: Text('Budapest',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: YahaFontSizes.xxLarge)),
                  // ),
                ),
                background: Image.asset(
                  'assets/images/Budapest-dark.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              leading: IconButton(
                iconSize: YahaFontSizes.xxLarge,
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: YahaColors.accentColor,
                ),
                onPressed: () {
                  // do something
                },
              )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin:
                      EdgeInsets.symmetric(vertical: YahaSpaceSizes.general),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.play_circle_rounded,
                            color: YahaColors.accentColor,
                            size: YahaFontSizes.large,
                          ),
                          onPressed: () {},
                          label: Text('Start hike',
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
                        padding: const EdgeInsets.all(YahaSpaceSizes.general),
                        child: Text(
                            'It is the capital of Hungary on the banks of the Danube, the home of the 19th century Chain Bridge, the Old Town of Buda and Castle Hill.',
                            style: TextStyle(
                                fontSize: YahaFontSizes.medium,
                                fontWeight: FontWeight.w400,
                                color: YahaColors.textColor)),
                      ),
                      Container(
                          padding: const EdgeInsets.all(YahaSpaceSizes.general),
                          height: 220.0,
                          width: MediaQuery.of(context).size.width,
                          child: Gallery()),
                      Container(
                        height: 300,
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(YahaSpaceSizes.general),
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                          crossAxisCount: 3,
                          children: <Widget>[
                            Container(
                              padding:
                                  const EdgeInsets.all(YahaSpaceSizes.medium),
                              child: Column(
                                children: [
                                  Icon(Icons.hiking_rounded,
                                      size: YahaFontSizes.xxLarge,
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
                              padding:
                                  const EdgeInsets.all(YahaSpaceSizes.medium),
                              child: Column(
                                children: [
                                  Icon(Icons.trending_up_rounded,
                                      size: YahaFontSizes.xxLarge,
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
                              padding:
                                  const EdgeInsets.all(YahaSpaceSizes.medium),
                              child: Column(
                                children: [
                                  Icon(Icons.trending_down_rounded,
                                      size: YahaFontSizes.xxLarge,
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
                              padding:
                                  const EdgeInsets.all(YahaSpaceSizes.medium),
                              child: Column(
                                children: [
                                  Icon(Icons.watch_later_rounded,
                                      size: YahaFontSizes.xxLarge,
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
                              padding:
                                  const EdgeInsets.all(YahaSpaceSizes.medium),
                              child: Column(
                                children: [
                                  Icon(Icons.emoji_events_rounded,
                                      size: YahaFontSizes.xxLarge,
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
                              padding:
                                  const EdgeInsets.all(YahaSpaceSizes.medium),
                              child: Column(
                                children: [
                                  Icon(Icons.stars_rounded,
                                      size: YahaFontSizes.xxLarge,
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
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.general,
                            left: YahaSpaceSizes.general),
                        child: Column(
                          children: [
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
                      Container(
                        padding: const EdgeInsets.all(YahaSpaceSizes.general),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  right: YahaSpaceSizes.small),
                              child: SizedBox(
                                height: 50,
                                width: 180,
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.museum,
                                    color: YahaColors.accentColor,
                                    size: YahaFontSizes.large,
                                  ),
                                  onPressed: () {},
                                  label: Text('Museum',
                                      style: TextStyle(
                                        fontSize: YahaFontSizes.small,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                    primary: YahaColors.tourism,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9))),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: YahaSpaceSizes.general),
                            child: SizedBox(
                              height: 50,
                              width: 130,
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.park,
                                  color: YahaColors.accentColor,
                                  size: YahaFontSizes.large,
                                ),
                                onPressed: () {},
                                label: Text('Park',
                                    style: TextStyle(
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w600,
                                    )),
                                style: ElevatedButton.styleFrom(
                                  primary: YahaColors.natural,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(9))),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.small,
                            left: YahaSpaceSizes.general),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Show more',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w500,
                                    color: YahaColors.textColor)),
                            Icon(
                              Icons.chevron_right,
                              size: YahaFontSizes.xxLarge,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.general,
                            left: YahaSpaceSizes.general),
                        child: Column(
                          children: [
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
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(YahaSpaceSizes.general),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.general,
                                  left: YahaSpaceSizes.general),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: YahaColors.tourism,
                                    radius: YahaBorderRadius.poiSmall,
                                    child: Icon(
                                      Icons.location_city_rounded,
                                      size: YahaFontSizes.large,
                                      color: YahaColors.accentColor,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: YahaSpaceSizes.small),
                                    child: Text("Hungarian Parliament Building",
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            color: YahaColors.textColor)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.general,
                                  left: YahaSpaceSizes.general),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: YahaColors.tourism,
                                      radius: YahaBorderRadius.poiSmall,
                                      child: Icon(
                                        Icons.museum,
                                        size: YahaFontSizes.large,
                                        color: YahaColors.accentColor,
                                      )),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: YahaSpaceSizes.small),
                                    child: Text("Hungarian National Museum",
                                        style: TextStyle(
                                            fontSize: YahaFontSizes.small,
                                            color: YahaColors.textColor)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.general,
                                  left: YahaSpaceSizes.general),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: YahaColors.amenity,
                                      radius: YahaBorderRadius.poiSmall,
                                      child: Icon(
                                        Icons.pool_rounded,
                                        size: YahaFontSizes.large,
                                        color: YahaColors.accentColor,
                                      )),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: YahaSpaceSizes.small),
                                    child: Text("Széchenyi Thermal Bath",
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
                          color: YahaColors.tertiaryAccentColor,
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.small,
                            left: YahaSpaceSizes.general),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Show more',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w500,
                                    color: YahaColors.textColor)),
                            Icon(
                              Icons.chevron_right,
                              size: YahaFontSizes.xxLarge,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 340,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(YahaSpaceSizes.general),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(YahaBorderRadius.general),
                          child: Image.asset(
                            'assets/images/elevation.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: YahaSpaceSizes.general,
                            left: YahaSpaceSizes.general),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Weather',
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
                        height: 160,
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.only(
                              top: YahaSpaceSizes.general,
                              left: YahaSpaceSizes.general,
                              right: YahaSpaceSizes.general),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          children: <Widget>[
                            Container(
                              padding:
                                  const EdgeInsets.all(YahaSpaceSizes.small),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(
                                        YahaSpaceSizes.xSmall),
                                    child: const Text(
                                      'Wed',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small),
                                    ),
                                  ),
                                  const Icon(Icons.wb_sunny,
                                      size: YahaFontSizes.xxLarge,
                                      color: Colors.yellow),
                                  Container(
                                    padding: const EdgeInsets.all(
                                        YahaSpaceSizes.xSmall),
                                    child: const Text(
                                      '19 | 12',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small),
                                    ),
                                  )
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
                                  const EdgeInsets.all(YahaSpaceSizes.small),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(
                                        YahaSpaceSizes.xSmall),
                                    child: const Text(
                                      'Wed',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small),
                                    ),
                                  ),
                                  Icon(Icons.cloud,
                                      size: YahaFontSizes.xxLarge,
                                      color: YahaColors.accentColor),
                                  Container(
                                    padding: const EdgeInsets.all(
                                        YahaSpaceSizes.xSmall),
                                    child: const Text(
                                      '19 | 12',
                                      style: TextStyle(
                                          fontSize: YahaFontSizes.small),
                                    ),
                                  )
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
                              padding: const EdgeInsets.all(3),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: YahaSpaceSizes.large,
                                    left: YahaSpaceSizes.small,
                                    right: YahaSpaceSizes.small,
                                    bottom: YahaSpaceSizes.general),
                                child: Text(
                                  'The day of your hike',
                                  style: TextStyle(
                                      color: YahaColors.textColor,
                                      fontSize: YahaFontSizes.small),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      YahaBorderRadius.general),
                                  border: Border.all(
                                      width: 2.0, color: YahaColors.textColor)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 0,
                            right: YahaSpaceSizes.general,
                            bottom: YahaSpaceSizes.general),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Show more',
                                style: TextStyle(
                                    fontSize: YahaFontSizes.small,
                                    fontWeight: FontWeight.w500,
                                    color: YahaColors.textColor)),
                            Icon(
                              Icons.chevron_right,
                              size: YahaFontSizes.xxLarge,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(YahaSpaceSizes.general),
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.timeline,
                              color: YahaColors.accentColor,
                              size: YahaFontSizes.large,
                            ),
                            onPressed: () {},
                            label: Text('Hike outline',
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

SpeedDial buildSpeedDial() {
  return SpeedDial(
    /// both default to 16
    marginEnd: 18,
    marginBottom: 820,
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
    curve: Curves.bounceIn,
    overlayColor: YahaColors.textColor,
    overlayOpacity: 0.5,
    onOpen: () => print('OPENING DIAL'),
    onClose: () => print('DIAL CLOSED'),
    tooltip: 'Speed Dial',
    heroTag: 'speed-dial-hero-tag',
    backgroundColor: YahaColors.accentColor,
    foregroundColor: YahaColors.textColor,
    elevation: 8.0,
    shape: CircleBorder(),

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
        child: Icon(Icons.settings_rounded, color: YahaColors.accentColor),
        backgroundColor: YahaColors.primary,
        label: 'Settings',
        labelStyle: TextStyle(fontSize: YahaFontSizes.medium),
        onTap: () => print('FIRST CHILD'),
        onLongPress: () => print('FIRST CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: Icon(Icons.comment_rounded, color: YahaColors.accentColor),
        backgroundColor: YahaColors.primary,
        label: 'Comment',
        labelStyle: TextStyle(fontSize: YahaFontSizes.medium),
        onTap: () => print('SECOND CHILD'),
        onLongPress: () => print('SECOND CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: Icon(Icons.bookmark_rounded, color: YahaColors.accentColor),
        backgroundColor: YahaColors.primary,
        label: 'Bookmark',
        labelStyle: TextStyle(fontSize: YahaFontSizes.medium),
        onTap: () => print('THIRD CHILD'),
        onLongPress: () => print('THIRD CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: Icon(Icons.download_rounded, color: YahaColors.accentColor),
        backgroundColor: YahaColors.primary,
        label: 'Download',
        labelStyle: TextStyle(fontSize: YahaFontSizes.medium),
        onTap: () => print('THIRD CHILD'),
        onLongPress: () => print('THIRD CHILD LONG PRESS'),
      ),
    ],
  );
}
