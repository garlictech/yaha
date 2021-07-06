import 'package:flutter/material.dart';
import 'package:mobile_app/hike-page.dart';
import 'package:mobile_app/log-in-page.dart';
import 'package:mobile_app/profile-page.dart';
import 'package:mobile_app/sign-up-page.dart';
import 'package:mobile_app/track-page.dart';
import 'package:mobile_app/yaha-colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'explore-page.dart';

// PersistentTabController _controller;

// _controller = PersistentTabController(initialIndex: 0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      // controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [HikePage(), SignUpPage(), LogInPage(), ProfilePage()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home_rounded),
      title: ("Home"),
      activeColorPrimary: YahaColors.tertiaryAccentColorDark,
      activeColorSecondary: YahaColors.primary,
      inactiveColorPrimary: YahaColors.textColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.travel_explore),
      title: ("Explore"),
      activeColorPrimary: YahaColors.tertiaryAccentColorDark,
      activeColorSecondary: YahaColors.primary,
      inactiveColorPrimary: YahaColors.textColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.play_circle_fill),
      title: ("Track"),
      activeColorPrimary: YahaColors.tertiaryAccentColorDark,
      activeColorSecondary: YahaColors.primary,
      inactiveColorPrimary: YahaColors.textColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.face_rounded),
      title: ("Profile"),
      activeColorPrimary: YahaColors.tertiaryAccentColorDark,
      activeColorSecondary: YahaColors.primary,
      inactiveColorPrimary: YahaColors.textColor,
    ),
  ];
}
