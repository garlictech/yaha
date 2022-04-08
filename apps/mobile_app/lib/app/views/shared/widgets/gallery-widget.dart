import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'yaha-border-radius.dart';

class GalleryWidget extends StatelessWidget {
  final List<String>? imageUrls;
  const GalleryWidget(
      {Key? key,
      this.imageUrls = const [
        'https://cdn2.iconfinder.com/data/icons/mountain-landscape-2/138/hiking_boots_hiking_logo_hiking_chair_hiking_drawing_hiking_day_hiking_flyer_hiking_in_winter-1024.png'
      ]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 1.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        initialPage: 3,
      ),
      items: imageUrls
          ?.map<Widget>((url) => ClipRRect(
                borderRadius: BorderRadius.circular(YahaBorderRadius.general),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
