//import 'dart:html';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'app-theme.dart';

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
                  child: Flexible(
                    flex: 1,
                    child: Text('Budapest',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
                background: Image.asset(
                  'assets/images/Budapest-dark.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              leading: IconButton(
                iconSize: 40.0,
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppTheme.colors.accentColor,
                ),
                onPressed: () {
                  // do something
                },
              )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.play_circle_rounded,
                            color: AppTheme.colors.accentColor,
                            size: 24.0,
                          ),
                          onPressed: () {},
                          label: Text('Start hike',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              )),
                          style: ElevatedButton.styleFrom(
                            primary: AppTheme.colors.primary,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                            'It is the capital of Hungary on the banks of the Danube, the home of the 19th century Chain Bridge, the Old Town of Buda and Castle Hill.',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.colors.textColor)),
                      ),
                      Container(
                        height: 220.0,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 1.0,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            initialPage: 3,
                          ),
                          items: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                    'assets/images/Parlament.jpg',
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                          crossAxisCount: 3,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Icon(Icons.hiking_rounded,
                                      size: 32.0,
                                      color:
                                          AppTheme.colors.secondaryAccentColor),
                                  Text("24.3km",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme
                                              .colors.secondaryAccentColor)),
                                  Text("Distance",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme
                                              .colors.secondaryAccentColor)),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0,
                                      color: AppTheme
                                          .colors.secondaryAccentColor)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Icon(Icons.trending_up_rounded,
                                      size: 32.0,
                                      color:
                                          AppTheme.colors.secondaryAccentColor),
                                  Text("576m",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme
                                              .colors.secondaryAccentColor)),
                                  Text("Uphill",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme
                                              .colors.secondaryAccentColor)),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0,
                                      color: AppTheme
                                          .colors.secondaryAccentColor)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Icon(Icons.trending_down_rounded,
                                      size: 32.0,
                                      color:
                                          AppTheme.colors.secondaryAccentColor),
                                  Text("1.2km",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme
                                              .colors.secondaryAccentColor)),
                                  Text("Downhill",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme
                                              .colors.secondaryAccentColor)),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0,
                                      color: AppTheme
                                          .colors.secondaryAccentColor)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Icon(Icons.watch_later_rounded,
                                      size: 32.0,
                                      color:
                                          AppTheme.colors.secondaryAccentColor),
                                  Text("6h",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme
                                              .colors.secondaryAccentColor)),
                                  Text("Time",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme
                                              .colors.secondaryAccentColor)),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0,
                                      color: AppTheme
                                          .colors.secondaryAccentColor)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Icon(Icons.emoji_events_rounded,
                                      size: 32.0,
                                      color:
                                          AppTheme.colors.secondaryAccentColor),
                                  Text("240",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme
                                              .colors.secondaryAccentColor)),
                                  Text("Points",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme
                                              .colors.secondaryAccentColor)),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0,
                                      color: AppTheme
                                          .colors.secondaryAccentColor)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Icon(Icons.stars_rounded,
                                      size: 32.0,
                                      color: AppTheme.colors.secondary),
                                  Text("Medium",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.colors.secondary)),
                                  Text("Difficulty",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme.colors.secondary)),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0,
                                      color: AppTheme.colors.secondary)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Things on route',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.colors.textColor)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 50,
                                width: 180,
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.museum,
                                    color: AppTheme.colors.accentColor,
                                    size: 24.0,
                                  ),
                                  onPressed: () {},
                                  label: Text('Museum',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                    primary: AppTheme.colors.tourism,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9))),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 50,
                                width: 160,
                                child: ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.fastfood_rounded,
                                    color: AppTheme.colors.accentColor,
                                    size: 24.0,
                                  ),
                                  onPressed: () {},
                                  label: Text('Fast food',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                    primary: AppTheme.colors.amenity,
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
                            padding: const EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 50,
                              width: 130,
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.park,
                                  color: AppTheme.colors.accentColor,
                                  size: 24.0,
                                ),
                                onPressed: () {},
                                label: Text('Park',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    )),
                                style: ElevatedButton.styleFrom(
                                  primary: AppTheme.colors.natural,
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
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Show more',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.colors.textColor)),
                            Icon(
                              Icons.chevron_right,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Most interesting places on route',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.colors.textColor)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppTheme.colors.tourism,
                                    radius: 20,
                                    child: Icon(
                                      Icons.location_city_rounded,
                                      size: 25.0,
                                      color: AppTheme.colors.accentColor,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Hungarian Parliament Building",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppTheme.colors.textColor)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: AppTheme.colors.tourism,
                                      radius: 20,
                                      child: Icon(
                                        Icons.museum,
                                        size: 25.0,
                                        color: AppTheme.colors.accentColor,
                                      )),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Hungarian National Museum",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppTheme.colors.textColor)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20, left: 20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: AppTheme.colors.amenity,
                                      radius: 20,
                                      child: Icon(
                                        Icons.pool_rounded,
                                        size: 25.0,
                                        color: AppTheme.colors.accentColor,
                                      )),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Széchenyi Thermal Bath",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppTheme.colors.textColor)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.colors.tertiaryAccentColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Show more',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.colors.textColor)),
                            Icon(
                              Icons.chevron_right,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 340,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/images/elevation.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Weather',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.colors.textColor)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 160,
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      'Wed',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  const Icon(Icons.wb_sunny,
                                      size: 40.0, color: Colors.yellow),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      '19 | 12',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
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
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      'Wed',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  Icon(Icons.cloud,
                                      size: 40.0,
                                      color: AppTheme.colors.accentColor),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      '19 | 12',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
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
                                    top: 35, left: 10, right: 10, bottom: 20),
                                child: Text(
                                  'The day of your hike',
                                  style: TextStyle(
                                      color: AppTheme.colors.textColor,
                                      fontSize: 16.0),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 2.0,
                                      color: AppTheme.colors.textColor)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 0, right: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Show more',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.colors.textColor)),
                            Icon(
                              Icons.chevron_right,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.timeline,
                              color: AppTheme.colors.accentColor,
                              size: 24.0,
                            ),
                            onPressed: () {},
                            label: Text('Hike outline',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                )),
                            style: ElevatedButton.styleFrom(
                              primary: AppTheme.colors.primary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
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
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppTheme.colors.textColor,
        selectedItemColor: AppTheme.colors.primary,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.play_circle), label: 'Profile'),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile')
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
    marginBottom: 730,
    // animatedIcon: AnimatedIcons.menu_close,
    // animatedIconTheme: IconThemeData(size: 22.0),
    /// This is ignored if animatedIcon is non null
    icon: Icons.expand_more,
    activeIcon: Icons.expand_less,
    // iconTheme: IconThemeData(color: AppTheme.colors.secondaryAccentColor[50], size: 30),

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
    overlayColor: AppTheme.colors.textColor,
    overlayOpacity: 0.5,
    onOpen: () => print('OPENING DIAL'),
    onClose: () => print('DIAL CLOSED'),
    tooltip: 'Speed Dial',
    heroTag: 'speed-dial-hero-tag',
    backgroundColor: AppTheme.colors.accentColor,
    foregroundColor: AppTheme.colors.textColor,
    elevation: 8.0,
    shape: CircleBorder(),

    orientation: SpeedDialOrientation.Down,
    // childMarginBottom: 2,
    // childMarginTop: 2,
    // gradientBoxShape: BoxShape.rectangle,
    //gradient: LinearGradient(
    //begin: Alignment.topCenter,
    //end: Alignment.bottomCenter,
    //colors: [Colors.black, AppTheme.colors.accentColor],
    //),
    children: [
      SpeedDialChild(
        child: Icon(Icons.settings_rounded, color: AppTheme.colors.accentColor),
        backgroundColor: AppTheme.colors.primary,
        label: 'Settings',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => print('FIRST CHILD'),
        onLongPress: () => print('FIRST CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: Icon(Icons.comment_rounded, color: AppTheme.colors.accentColor),
        backgroundColor: AppTheme.colors.primary,
        label: 'Comment',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => print('SECOND CHILD'),
        onLongPress: () => print('SECOND CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: Icon(Icons.bookmark_rounded, color: AppTheme.colors.accentColor),
        backgroundColor: AppTheme.colors.primary,
        label: 'Bookmark',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => print('THIRD CHILD'),
        onLongPress: () => print('THIRD CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: Icon(Icons.download_rounded, color: AppTheme.colors.accentColor),
        backgroundColor: AppTheme.colors.primary,
        label: 'Download',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => print('THIRD CHILD'),
        onLongPress: () => print('THIRD CHILD LONG PRESS'),
      ),
    ],
  );
}
