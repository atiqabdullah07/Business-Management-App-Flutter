import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smokin_joes/Screens/DashBoard_Settings.dart';
import 'package:smokin_joes/Screens/Home.dart';
import 'package:smokin_joes/Screens/Profile_Page.dart';

import '../Widgets/Gradient_Icon.dart';

class BNB extends StatelessWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          context,
          screens: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: const Home(),
                  ),
                ),
              ],
            ),
            // const Search(),
            Profile_Page(),
            Dashboard_Settings(),
          ],
          items: [
            buildPersistentBottomNavBarItem(Icons.home_filled),
            buildPersistentBottomNavBarItem(Icons.account_circle_outlined),
            buildPersistentBottomNavBarItem(Icons.settings),
          ],
          navBarStyle: NavBarStyle.style12,
          bottomScreenMargin: 0,
          resizeToAvoidBottomInset: true,
          hideNavigationBarWhenKeyboardShows: true,
          navBarHeight: 52.h,
          confineInSafeArea: false,
          padding: NavBarPadding.only(left: 30.w, right: 30.w),
          backgroundColor: Colors.white,
          margin: EdgeInsets.only(
            bottom: 10.h,
            left: 50.w,
            right: 50.w,
          ),
          decoration: NavBarDecoration(
            colorBehindNavBar: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(50.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: -7.r,
                blurRadius: 10.r,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PersistentBottomNavBarItem buildPersistentBottomNavBarItem(
      IconData iconData) {
    return PersistentBottomNavBarItem(
      icon: GradientIcon(
        iconSize: 25.r,
        iconData: iconData,
      ),
      inactiveIcon: Icon(
        iconData,
        color: Colors.black,
        size: 25.r,
      ),
      title: '.',
      activeColorSecondary: const Color(0xff192C62),
    );
  }
}
