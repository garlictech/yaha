import 'package:flutter/material.dart';
import 'package:yaha/hike-page.dart';
import 'package:yaha/utility/yaha-border-radius.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class HikeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final int? distanceFromCurrentLocation;
  final String backgroundImage;

  const HikeCard({
    Key? key,
    required this.title,
    required this.subTitle,
    this.distanceFromCurrentLocation,
    required this.backgroundImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.circular(YahaBorderRadius.poiSmall),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HikePage()));
          },
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.35), BlendMode.darken),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
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
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w700,
                          color: YahaColors.background,
                        ),
                      ),
                      Text(
                        subTitle + ' ($distanceFromCurrentLocation km away)',
                        style: TextStyle(
                          fontSize: YahaFontSizes.small,
                          fontWeight: FontWeight.w600,
                          color: YahaColors.background,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
