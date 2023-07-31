import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/AppText.dart';
import '../Constants/colors.dart';

class CustomDateRangePicker extends StatefulWidget {
  CustomDateRangePicker({Key? key, required this.width}) : super(key: key);
  final double width;
  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  State<CustomDateRangePicker> createState() => _CustomDateRangePickerState();
}

class _CustomDateRangePickerState extends State<CustomDateRangePicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDateRangePicker(
          context: context,
          firstDate: DateTime(2001),
          lastDate: DateTime(2222),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColors.tertiary,
                ),
              ),
              child: child!,
            );
          },
        ).then((date) {
          setState(() {
            widget.dateTimeRange = date!;
          });
        });
      },
      child: Container(
        height: 35.h,
        width: widget.width,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(50.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
                title:
                    '${widget.dateTimeRange.start.toString().split(' ')[0]} - ${widget.dateTimeRange.end.toString().split(' ')[0]}',
                color: AppColors.secondary,
                size: 10.sp,
                fontWeight: FontWeight.w500)
          ],
        ),
      ),
    );
  }
}
