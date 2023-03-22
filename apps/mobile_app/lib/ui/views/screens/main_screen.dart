import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:yaha/ui/providers/main_tab_controller.dart';
import 'package:yaha/ui/views/screens/settings-screen.dart';
import 'package:yaha/ui/views/screens/search_hike_screen.dart';
import 'package:yaha/ui/views/shared/shared.dart';

import 'overview_screen.dart';
import 'tracking.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(mainTabControllerProvider);

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
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

  List<Widget> buildScreens() {
    return [
      OverviewScreen(),
      const SearchHikeScreen(),
      const TrackingScreen(),
      const SettingsScreen()
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    const activeColorPrimary = YahaColors.darkGreen;
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_rounded),
          title: ("Home"),
          activeColorPrimary: activeColorPrimary),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.travel_explore),
          title: ("Explore"),
          activeColorPrimary: activeColorPrimary),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.play_circle_fill),
          title: ("Track"),
          activeColorPrimary: activeColorPrimary),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.face_rounded),
          title: ("Profile"),
          activeColorPrimary: activeColorPrimary),
    ];
  }
}
