import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smokin_joes/Constants/AppText.dart';

import '../Constants/colors.dart';

class CARD3 extends StatelessWidget {
  final String ImagePath;
  final String title;
  final String subTitle;
  const CARD3(
      {Key? key,
      required this.ImagePath,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 20.h),
      child: Container(
        height: 160.h,
        decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Padding(
          padding: EdgeInsets.only(left: 40.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                      title: title,
                      color: AppColors.secondary,
                      size: 14.sp,
                      fontWeight: FontWeight.w500),
                  AppText(
                      title: subTitle,
                      color: AppColors.secondary,
                      size: 20.sp,
                      fontWeight: FontWeight.w600),
                ],
              ),
              SizedBox(
                height: 120.16.h,
                width: 132.58.w,
                child: SvgPicture.asset(
                  ImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
