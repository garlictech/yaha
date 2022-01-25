import 'package:flutter/material.dart';
import 'package:yaha/hike/hike-card/hike-card.dart';
import 'package:yaha/models/ModelProvider.dart';
//import 'package:yaha/utility/buttons/show-more-button.dart';
import 'package:yaha/utility/yaha-box-sizes.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class HorizontalHikeCards extends StatelessWidget {
  final String title;
  final List<Hike> hikes;

  HorizontalHikeCards({required this.title, required this.hikes});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(bottom: YahaSpaceSizes.medium),
        alignment: Alignment.centerLeft,
        child: Text(
          'Best hikes of the world',
          style: TextStyle(
              fontSize: YahaFontSizes.medium,
              fontWeight: FontWeight.w600,
              color: YahaColors.textColor),
        ),
      ),
      Container(
          height: YahaBoxSizes.heightMedium,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: hikes
                  .map((hike) => Container(
                        padding: EdgeInsets.only(right: YahaSpaceSizes.general),
                        width: YahaBoxSizes.widthMedium,
                        child: HikeCard(
                          title: hike.description?.first.title ?? '',
                          subTitle: hike.description?.first.summary ?? '',
                          backgroundImage: hike.imageUrls?.first ?? '',
                        ),
                      ))
                  .toList())),
//      ShowMoreButton(nextScreen: BestHikesOfTheWorld())
    ]);
  }
}
