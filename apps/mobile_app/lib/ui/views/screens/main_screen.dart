import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:yaha/ui/views/auth/screens/login_screen.dart';
import 'package:yaha/ui/views/hikes/track/screens/tracking.dart';
import 'package:yaha/ui/views/personal/screen/settings-screen.dart';
import 'package:yaha/ui/views/search/search_hike_screen.dart';
import 'package:yaha/ui/views/shared/shared.dart';

import 'overview_screen.dart';

class MainScreen extends StatelessWidget {
  late final PersistentTabController controller;

  MainScreen({Key? key}) : super(key: key) {
    controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: YahaColors.background, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: YahaColors.divider, width: 0.2)),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      OverviewScreen(tabController: controller),
      const SearchHikeScreen(),
      const TrackingScreen(),
      const SettingsScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_rounded),
          title: ("Home"),
          activeColorPrimary: YahaColors.accentColorDark,
          activeColorSecondary: YahaColors.primary,
          inactiveColorPrimary: YahaColors.textColor),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.travel_explore),
          title: ("Explore"),
          activeColorPrimary: YahaColors.accentColorDark,
          activeColorSecondary: YahaColors.primary,
          inactiveColorPrimary: YahaColors.textColor),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.play_circle_fill),
          title: ("Track"),
          activeColorPrimary: YahaColors.accentColorDark,
          activeColorSecondary: YahaColors.primary,
          inactiveColorPrimary: YahaColors.textColor),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.face_rounded),
          title: ("Profile"),
          activeColorPrimary: YahaColors.accentColorDark,
          activeColorSecondary: YahaColors.primary,
          inactiveColorPrimary: YahaColors.textColor)
    ];
  }
}
