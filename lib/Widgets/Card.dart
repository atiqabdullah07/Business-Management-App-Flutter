import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/colors.dart';

class CARD extends StatelessWidget {
  const CARD({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.w,
          right: 35.4.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.r,
                      child: Center(
                        child: AppText(
                            title: '\$',
                            color: AppColors.secondary,
                            size: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                            title: 'Total Business',
                            color: AppColors.secondary,
                            size: 12.sp,
                            fontWeight: FontWeight.w500),
                        AppText(
                            title: '\$86130.79',
                            color: AppColors.greyText,
                            size: 10.sp,
                            fontWeight: FontWeight.w500),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Container(
                    height: 30.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('Images/arrow_icon.png'),
                        Container(
                          color: Colors.white,
                          height: 13.h,
                          width: 0.5.w,
                        ),
                        AppText(
                            title: 'View More',
                            color: Colors.white,
                            size: 9.sp,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 114.16.h,
              width: 132.58.w,
              child: SvgPicture.asset('Images/Drawer_Icons/Group 124.svg'),
            )
          ],
        ),
      ),
    );
  }
}
