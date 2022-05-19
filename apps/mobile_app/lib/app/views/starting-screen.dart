import 'package:flutter/material.dart';
import 'package:yaha/app/views/shared/shared.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/yaha-logo-01-green@2x.png',
                width: 122.0,
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(YahaBorderRadius.general),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavBarWidget()));
                      },
                      child: Container(
                        color: YahaColors.grey600,
                        height: 168,
                        width: 168,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: YahaSpaceSizes.small),
                    child: Text(
                      'Hikes',
                      style: TextStyle(
                          color: YahaColors.textColor,
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(YahaBorderRadius.general),
                    child: Container(
                      color: YahaColors.grey600,
                      height: 168,
                      width: 168,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: YahaSpaceSizes.small),
                    child: Text(
                      'Achievements',
                      style: TextStyle(
                          color: YahaColors.textColor,
                          fontSize: YahaFontSizes.medium,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
