import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/colors.dart';

class AlertDialog1 extends StatelessWidget {
  const AlertDialog1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      backgroundColor: AppColors.background,
      title: const Text('User Options'),
      titlePadding: EdgeInsets.only(left: 110.w, top: 20.h),
      content: Builder(
        builder: (context) {
          return Container(
            height: 120.h,
            width: 300.w,
            color: AppColors.background,
            child: Column(
              children: [
                button(context, 'Change Password', Icons.person, () {}),
                SizedBox(
                  height: 10.h,
                ),
                button(context, 'Sign out', Icons.exit_to_app, () {}),
              ],
            ),
          );
        },
      ),
    );
  }

  GestureDetector button(BuildContext context, String title, IconData iconData,
      VoidCallback voidCallback) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        height: 55.h,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            //color: Color(0xff192C62),
            color: AppColors.primary),
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Icon(
              iconData,
              size: 20.r,
              color: AppColors.secondary,
            ),
            SizedBox(
              width: 10.w,
            ),
            AppText(
                title: title,
                color: AppColors.secondary,
                size: 17.sp,
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
