import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/AppText.dart';
import '../Constants/colors.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    Key? key,
    this.width,
    required this.dateTime,
    this.dateCallBack,
  }) : super(key: key);
  final double? width;
  final Function? dateCallBack;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2001),
            lastDate: DateTime(2222),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.tertiary, // <-- SEE HERE
                  ),
                ),
                child: child!,
              );
            },
          ).then((date) {
            log(date.toString());
            dateCallBack!(date);
          });
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
                title: dateTime,
                color: AppColors.secondary,
                size: 12.sp,
                fontWeight: FontWeight.w500),
            ImageIcon(
              const AssetImage('Images/Icons/icons8_calendar.png'),
              color: AppColors.secondary,
              size: 14.r,
            ),
          ],
        ),
      ),
    );
  }
}
