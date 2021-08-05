import 'package:flutter/material.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class HikeCard extends StatelessWidget {
  //final Color color;
  final String title;
  final String subTitle;
  final int distanceFromCurrentLocation;

  const HikeCard({
    Key? key,
    //required this.color,
    required this.title,
    required this.subTitle,
    required this.distanceFromCurrentLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(YahaBorderRadius.poiSmall),
        child: Container(
          //color: color,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Parlament.jpg'),
                fit: BoxFit.cover),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(
                left: YahaSpaceSizes.small,
                bottom: YahaSpaceSizes.small,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: YahaFontSizes.large,
                      fontWeight: FontWeight.w700,
                      color: YahaColors.background,
                    ),
                  ),
                  Text(
                    subTitle + ' ($distanceFromCurrentLocation km away)',
                    style: TextStyle(
                      fontSize: YahaFontSizes.medium,
                      fontWeight: FontWeight.w600,
                      color: YahaColors.background,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
