import 'package:flutter/material.dart';

import 'yaha-colors.dart';

class YahaImage extends StatelessWidget {
  final String? imageUrl;
  const YahaImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 1500),
        child: Stack(children: [
          const Center(
              child: CircularProgressIndicator(color: YahaColors.lightGreen)),
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imageUrl ??
                            'https://cdn2.iconfinder.com/data/icons/mountain-landscape-2/138/hiking_boots_hiking_logo_hiking_chair_hiking_drawing_hiking_day_hiking_flyer_hiking_in_winter-1024.png',
                      ))))
        ]));
  }
}
