//import 'dart:html';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:flutter/material.dart';
import 'BottomBar.dart';

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
                  Icons.arrow_back,
                  color: Colors.white,
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
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Start hike',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              )),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
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
                            )),
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
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: const Text("Distance"),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0, color: Colors.grey)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: const Text('Uphill'),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0, color: Colors.grey)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: const Text('Downhill'),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0, color: Colors.grey)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: const Text('Time'),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0, color: Colors.grey)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: const Text('Points'),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0, color: Colors.grey)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: const Text('Difficulty'),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0, color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Things on route',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  )),
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
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Museum',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
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
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Fast food',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.purple,
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
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Park',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    )),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
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
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Show all',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Most interesting places on route',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(20),
                        child: const Text(""),
                        decoration: BoxDecoration(
                          color: Colors.lime[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Show all',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  )),
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
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Weather',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: const Text("Today"),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0, color: Colors.grey)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: const Text('Wed'),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0, color: Colors.grey)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              child: const Text('Day of hike'),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 4.0, color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text('Show all',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Hike outline',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              )),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
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
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.green,
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
    icon: Icons.add,
    activeIcon: Icons.remove,
    // iconTheme: IconThemeData(color: Colors.grey[50], size: 30),

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
    overlayColor: Colors.black,
    overlayOpacity: 0.5,
    onOpen: () => print('OPENING DIAL'),
    onClose: () => print('DIAL CLOSED'),
    tooltip: 'Speed Dial',
    heroTag: 'speed-dial-hero-tag',
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 8.0,
    shape: CircleBorder(),

    orientation: SpeedDialOrientation.Down,
    // childMarginBottom: 2,
    // childMarginTop: 2,
    // gradientBoxShape: BoxShape.rectangle,
    //gradient: LinearGradient(
    //begin: Alignment.topCenter,
    //end: Alignment.bottomCenter,
    //colors: [Colors.black, Colors.white],
    //),
    children: [
      SpeedDialChild(
        child: Icon(Icons.settings),
        backgroundColor: Colors.red,
        label: 'Settings',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => print('FIRST CHILD'),
        onLongPress: () => print('FIRST CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: Icon(Icons.comment),
        backgroundColor: Colors.blue,
        label: 'Comment',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => print('SECOND CHILD'),
        onLongPress: () => print('SECOND CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: Icon(Icons.bookmark),
        backgroundColor: Colors.green,
        label: 'Bookmark',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => print('THIRD CHILD'),
        onLongPress: () => print('THIRD CHILD LONG PRESS'),
      ),
      SpeedDialChild(
        child: Icon(Icons.download_rounded),
        backgroundColor: Colors.green,
        label: 'Download',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => print('THIRD CHILD'),
        onLongPress: () => print('THIRD CHILD LONG PRESS'),
      ),
    ],
  );
}
