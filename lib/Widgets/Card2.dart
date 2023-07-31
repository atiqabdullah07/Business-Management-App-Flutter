import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smokin_joes/Constants/AppText.dart';

import '../Constants/colors.dart';

class CARD2 extends StatelessWidget {
  final String ImagePath;
  final String title;

  const CARD2({Key? key, required this.ImagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 20.h),
      child: Container(
        height: 160.h,
        width: 1.sw,
        decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Padding(
          padding: EdgeInsets.only(left: 40.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                      title: title,
                      color: AppColors.secondary,
                      size: 20.sp,
                      fontWeight: FontWeight.w500),
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
