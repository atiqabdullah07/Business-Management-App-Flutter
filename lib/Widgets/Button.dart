import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/colors.dart';

import '../Constants/AppText.dart';

class AppButton extends StatelessWidget {
  final double width;
  final double hight;
  final String title;

  final double fontSize;
  Color? color;
  final VoidCallback voidCallback;

  AppButton(
      {Key? key,
      required this.width,
      required this.title,
      required this.voidCallback,
      required this.hight,
      this.color = AppColors.tertiary,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight,
      width: width,
      child: ElevatedButton(
          onPressed: voidCallback,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(color),
          ),
          child: AppText(
              title: title,
              color: Colors.white,
              size: fontSize.sp,
              fontWeight: FontWeight.w500)),
    );
  }
}
