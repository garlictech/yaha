import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'yaha-border-radius.dart';
import 'yaha-image.dart';

class GalleryWidget extends StatelessWidget {
  final List<String>? imageUrls;
  const GalleryWidget(
      {super.key,
      this.imageUrls = const [
        'https://cdn2.iconfinder.com/data/icons/mountain-landscape-2/138/hiking_boots_hiking_logo_hiking_chair_hiking_drawing_hiking_day_hiking_flyer_hiking_in_winter-1024.png'
      ]});

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
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1500),
                  child: YahaImage(key: UniqueKey(), imageUrl: url))))
          .toList(),
    );
  }
}
