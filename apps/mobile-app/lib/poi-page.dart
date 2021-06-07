import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app-theme.dart';

class PoiPage extends StatefulWidget {
  @override
  _PoiPageState createState() => _PoiPageState();
}

class _PoiPageState extends State<PoiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, //Center Row contents horizontally,

                          children: [
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 25.0,
                              color: AppTheme.colors.textColor,
                            ),
                            Text('Hungarian\nNational Museum',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.colors.textColor)),
                            Icon(Icons.comment,
                                size: 25, color: AppTheme.colors.textColor),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: CircleAvatar(
                              backgroundColor: AppTheme.colors.tourism,
                              radius: 40,
                              child: Icon(Icons.museum,
                                  color: AppTheme.colors.accentColor,
                                  size: 48)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                              'The Hungarian National Museum (Hungarian: Magyar Nemzeti Múzeum) was founded in 1802 and is the national museum for the history, art, and archaeology of Hungary.',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.colors.textColor)),
                        ),
                        Container(
                          height: 340,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'assets/images/poi_page.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(Icons.schedule_outlined)),
                              Text('Open',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.colors.primary)),
                              Text(' - closing: 18:00',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.colors.textColor)),
                              Icon(Icons.expand_more),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(Icons.location_on_outlined)),
                              Text('Opening hours',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.colors.textColor)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(Icons.call)),
                              Text('(06 1) 338 2122',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.colors.textColor)),
                            ],
                          ),
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
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 50,
                            width: 300,
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.add,
                                color: AppTheme.colors.accentColor,
                                size: 24.0,
                              ),
                              onPressed: () {},
                              label: Text('Add to hike',
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
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
