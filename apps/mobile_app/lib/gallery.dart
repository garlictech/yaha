import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/hike-page.dart';
import 'package:mobile_app/profile-page.dart';
import 'package:mobile_app/settings-page.dart';
import 'package:mobile_app/track-page.dart';
import 'package:mobile_app/yaha-border-radius.dart';
import 'package:mobile_app/yaha-colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'explore-page.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 1.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        initialPage: 3,
      ),
      items: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(YahaBorderRadius.general),
          child: Image.asset('assets/images/Parlament.jpg',
              fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
        ),
      ],
    );
  }
}
