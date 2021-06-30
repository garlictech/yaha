import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/yaha-border-radius.dart';

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
