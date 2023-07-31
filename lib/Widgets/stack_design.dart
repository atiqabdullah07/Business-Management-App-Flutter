import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/AppText.dart';
import '../Constants/colors.dart';

class StackDesign extends StatelessWidget {
  final String text1;
  final String text2;
  const StackDesign({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 35.h,
            decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: StackText(text1, AppColors.secondary),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 200.w,
              height: 33.h,
              decoration: const BoxDecoration(
                  color: AppColors.tertiary,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: StackText(text2, AppColors.background),
            ),
          ),
        ],
      ),
    );
  }

  Row StackText(String title, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 10.w,
        ),
        AppText(
            title: title,
            color: color,
            size: 11.sp,
            fontWeight: FontWeight.w500),
      ],
    );
  }
}
