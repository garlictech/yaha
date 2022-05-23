import 'package:flutter/material.dart';
import 'package:yaha/app/views/achievements/explore/screens/a-explore.dart';
import 'package:yaha/app/views/achievements/home/screens/a-home-screen.dart';
import 'package:yaha/app/views/achievements/market/screens/a-market-screen.dart';
import 'package:yaha/app/views/achievements/profile/screens/a-profile-screen.dart';
import 'package:yaha/app/views/hikes/home/views/screens/guest-home-screen.dart';
import 'package:yaha/app/views/hikes/personal/screen/profile-page.dart';
import 'package:yaha/app/views/hikes/track/screens/timecapsule-new-comments-screen.dart';
import 'package:yaha/app/views/hikes/track/screens/tracking.dart';
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
                                builder: (context) => const BottomNavBarWidget(
                                      firstScreen: HomePageGuest(),
                                      firstScreenIcon: Icons.home_rounded,
                                      firstScreenName: 'Home',
                                      secondScreen:
                                          TimeCapsuleNewCommentsScreen(),
                                      secondScreenIcon: Icons.travel_explore,
                                      secondScreenName: 'Explore',
                                      thirdScreen: TrackingScreen(),
                                      thirdScreenIcon: Icons.play_circle_fill,
                                      thirdScreenName: 'Track',
                                      fourthScreen: ProfilePage(),
                                      fourthScreenIcon: Icons.face_rounded,
                                      fourthScreenName: 'Profile',
                                    )));
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomNavBarWidget(
                                      firstScreen: AHomeScreen(),
                                      secondScreen: AExploreScreen(),
                                      thirdScreen: AMarketScreen(),
                                      fourthScreen: AProfileScreen(),
                                      firstScreenIcon: Icons.home_rounded,
                                      secondScreenIcon: Icons.travel_explore,
                                      thirdScreenIcon:
                                          Icons.shopping_bag_rounded,
                                      fourthScreenIcon: Icons.face_rounded,
                                      firstScreenName: 'Home',
                                      secondScreenName: 'Explore',
                                      thirdScreenName: 'Market',
                                      fourthScreenName: 'Profile',
                                    )));
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
