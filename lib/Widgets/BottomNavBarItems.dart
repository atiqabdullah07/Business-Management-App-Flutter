/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/colors.dart';

import 'Gradient_Icon.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  BottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 58,
        right: 58,
        bottom: 10,
      ),
      child: Container(
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.r)),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: -7,
              blurRadius: 20,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40.r)),
          child: Padding(
            padding: EdgeInsets.only(left: 55.w, right: 55.w),
            child: BottomNavigationBar(
              backgroundColor: AppColors.background,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              //onTap:widget.ontap,
              //onTap: (index) => setState(() => currentIndex = index),
              iconSize: 20.r,
              unselectedItemColor: AppColors.secondary,
              selectedItemColor: Colors.purple,
              selectedLabelStyle: const TextStyle(
                color: Colors.black,
              ),
              showUnselectedLabels: false,
              items: [
                BottomNavBarIcon(Icons.home_filled),
                BottomNavBarIcon(Icons.search),
                BottomNavBarIcon(Icons.dashboard_outlined),
                BottomNavBarIcon(Icons.account_circle_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem BottomNavBarIcon(IconData IconData) {
    return BottomNavigationBarItem(
      activeIcon: GradientIcon(
        iconSize: 20,
        iconData: IconData,
      ),
      icon: Icon(IconData),
      label: '.',
    );
  }
}
*/
