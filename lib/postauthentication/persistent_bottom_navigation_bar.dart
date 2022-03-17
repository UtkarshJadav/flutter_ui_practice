import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_demo/postauthentication/account.dart';
import 'package:flutter_demo/postauthentication/market.dart';
import 'package:flutter_demo/postauthentication/notification.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'activity.dart';
import 'dashboard.dart';

class PersistentBottomNavigationBar extends StatefulWidget {
  const PersistentBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<PersistentBottomNavigationBar> createState() => _PersistentBottomNavigationBarState();
}

class _PersistentBottomNavigationBarState extends State<PersistentBottomNavigationBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
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
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [const DashboardScreen(), const ActivityScreen(), const MarketScreen(), const NotificationScreen(), const MyAccountScreen()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.house_fill, size: 20),
      title: ("Home"),
      activeColorPrimary: primaryGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.square_favorites_fill, size: 20),
      title: ("Activity"),
      activeColorPrimary: primaryGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.chart_bar_circle_fill, size: 20),
      title: ("Market"),
      activeColorPrimary: primaryGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.bell_solid, size: 20),
      title: ("Alerts"),
      activeColorPrimary: primaryGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person_alt_circle_fill, size: 20),
      title: ("Account"),
      activeColorPrimary: primaryGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    )
  ];
}
