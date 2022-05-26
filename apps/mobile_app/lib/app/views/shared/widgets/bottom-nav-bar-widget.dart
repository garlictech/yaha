import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'yaha-colors.dart';
// PersistentTabController _controller;

// _controller = PersistentTabController(initialIndex: 0);

class BottomNavBarWidget extends StatelessWidget {
  final Widget firstScreen;
  final Widget secondScreen;
  final Widget thirdScreen;
  final Widget fourthScreen;
  final IconData firstScreenIcon;
  final IconData secondScreenIcon;
  final IconData thirdScreenIcon;
  final IconData fourthScreenIcon;
  final String firstScreenName;
  final String secondScreenName;
  final String thirdScreenName;
  final String fourthScreenName;

  const BottomNavBarWidget(
      {required this.firstScreen,
      required this.secondScreen,
      required this.thirdScreen,
      required this.fourthScreen,
      required this.firstScreenIcon,
      required this.secondScreenIcon,
      required this.thirdScreenIcon,
      required this.fourthScreenIcon,
      required this.firstScreenName,
      required this.secondScreenName,
      required this.thirdScreenName,
      required this.fourthScreenName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      // controller: _controller,
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
      firstScreen,
      secondScreen,
      thirdScreen,
      fourthScreen,
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(firstScreenIcon),
        title: (firstScreenName),
        activeColorPrimary: YahaColors.accentColorDark,
        activeColorSecondary: YahaColors.primary,
        inactiveColorPrimary: YahaColors.textColor,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(secondScreenIcon),
        title: (secondScreenName),
        activeColorPrimary: YahaColors.accentColorDark,
        activeColorSecondary: YahaColors.primary,
        inactiveColorPrimary: YahaColors.textColor,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(thirdScreenIcon),
        title: (thirdScreenName),
        activeColorPrimary: YahaColors.accentColorDark,
        activeColorSecondary: YahaColors.primary,
        inactiveColorPrimary: YahaColors.textColor,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(fourthScreenIcon),
        title: (fourthScreenName),
        activeColorPrimary: YahaColors.accentColorDark,
        activeColorSecondary: YahaColors.primary,
        inactiveColorPrimary: YahaColors.textColor,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ];
  }
}
