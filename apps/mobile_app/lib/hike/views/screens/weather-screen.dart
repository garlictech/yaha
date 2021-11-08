import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaha/hike/views/widgets/weather-column-tile-widget.dart';
import 'package:yaha/hike/views/widgets/weather-row-tile-widget.dart';
import 'package:yaha/utility/buttons/back-button.dart';
import 'package:yaha/utility/yaha-border-width.dart';
import 'package:yaha/utility/yaha-colors.dart';
import 'package:yaha/utility/yaha-font-sizes.dart';
import 'package:yaha/utility/yaha-space-sizes.dart';

class WeatherScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.red.shade300,
            Colors.orange.shade300,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: YahaBackButton(),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  'Budapest',
                                  style: TextStyle(
                                      color: YahaColors.textColor,
                                      fontSize: YahaFontSizes.large,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Sunny day',
                                  style: TextStyle(
                                      color: YahaColors.textColor,
                                      fontSize: YahaFontSizes.small,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: YahaSpaceSizes.general,
                            right: YahaSpaceSizes.general),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.large,
                                  bottom: YahaSpaceSizes.large),
                              child: Image.asset(
                                'assets/images/sunny.png',
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: YahaSpaceSizes.small),
                              child: Text(
                                '25º',
                                style: TextStyle(
                                    color: YahaColors.textColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: YahaSpaceSizes.small),
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: YahaColors.textColor,
                                            fontSize: YahaFontSizes.small,
                                            fontWeight: FontWeight.w400),
                                        children: [
                                          TextSpan(text: 'Max.: '),
                                          TextSpan(text: '27º'),
                                        ]),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: YahaColors.textColor,
                                          fontSize: YahaFontSizes.small,
                                          fontWeight: FontWeight.w400),
                                      children: [
                                        TextSpan(text: 'Min.: '),
                                        TextSpan(text: '15º'),
                                      ]),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.general,
                                  bottom: YahaSpaceSizes.small),
                              child: Divider(
                                color: YahaColors.textColor,
                                thickness: YahaBorderWidth.xxxSmall,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WeatherRowTile(
                                  time: 'Now',
                                  icon: 'assets/images/sunny.png',
                                  degree: '25º',
                                ),
                                WeatherRowTile(
                                  time: '16',
                                  icon: 'assets/images/sunny.png',
                                  degree: '24º',
                                ),
                                WeatherRowTile(
                                  time: '17',
                                  icon: 'assets/images/sunny.png',
                                  degree: '22º',
                                ),
                                WeatherRowTile(
                                  time: '18',
                                  icon: 'assets/images/overcast.png',
                                  degree: '20º',
                                ),
                                WeatherRowTile(
                                  time: '19',
                                  icon: 'assets/images/overcast.png',
                                  degree: '19º',
                                ),
                                WeatherRowTile(
                                  time: '19:59',
                                  icon: 'assets/images/sunset.png',
                                  degree: 'Sunset',
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: YahaSpaceSizes.small,
                                  bottom: YahaSpaceSizes.small),
                              child: Divider(
                                color: YahaColors.textColor,
                                thickness: YahaBorderWidth.xxxSmall,
                              ),
                            ),
                            Column(
                              children: [
                                WeatherColumnTile(
                                  day: 'Tuesday',
                                  icon: 'assets/images/sunny.png',
                                  maxDegree: '27',
                                  minDegree: '18',
                                ),
                                WeatherColumnTile(
                                  day: 'Wednesday',
                                  icon: 'assets/images/sunny.png',
                                  maxDegree: '25',
                                  minDegree: '15',
                                ),
                                WeatherColumnTile(
                                  day: 'Thursday',
                                  icon: 'assets/images/overcast.png',
                                  maxDegree: '22',
                                  minDegree: '16',
                                ),
                                WeatherColumnTile(
                                  day: 'Friday',
                                  icon: 'assets/images/rainy.png',
                                  maxDegree: '19',
                                  minDegree: '13',
                                ),
                                WeatherColumnTile(
                                  day: 'Saturday',
                                  icon: 'assets/images/rainy.png',
                                  maxDegree: '18',
                                  minDegree: '14',
                                ),
                                WeatherColumnTile(
                                  day: 'Sunday',
                                  icon: 'assets/images/sunny.png',
                                  maxDegree: '24',
                                  minDegree: '16',
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }, childCount: 1),
            ),
          ],
        ),
      ),
    );
  }
}