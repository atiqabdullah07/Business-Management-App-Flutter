import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smokin_joes/Constants/colors.dart';

class StoreDropDown extends StatelessWidget {
  const StoreDropDown({
    Key? key,
    required this.width,
    required this.initialValue,
    required this.dropDownItems,
    this.isSecondText,
    this.isIconEnabled,
    required this.isAlternativeColor,
    required this.onChangeValue,
  }) : super(key: key);

  final double width;
  final String initialValue;
  final List dropDownItems;
  final bool? isSecondText;
  final bool? isIconEnabled;
  final bool? isAlternativeColor;
  final Function onChangeValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
          isExpanded: true,
          buttonHeight: 35.h,
          itemPadding: const EdgeInsets.symmetric(horizontal: 8),
          buttonWidth: width,
          dropdownMaxHeight: 400.h,
          itemHeight: 45.h,
          scrollbarThickness: 0,
          iconOnClick: const Icon(
            Icons.keyboard_arrow_up_outlined,
            color: AppColors.secondary,
          ),
          buttonPadding:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
          buttonDecoration: const BoxDecoration(
            color: AppColors.primary,
            boxShadow: [],
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          dropdownDecoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          style: TextStyle(
            color: AppColors.secondary,
            fontSize: 11.sp,
          ),
          value: initialValue,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.secondary,
          ),
          items: dropDownItems.map((items) {
            return DropdownMenuItem(
              value: items,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                // height: 27.h,
                // width: 400.w,
                decoration: BoxDecoration(
                  color: dropDownItems.indexOf(items) % 2 == 0
                      ? (isAlternativeColor == true
                          ? const Color(0xffF5F5F5)
                          : Colors.transparent)
                      : Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                        dropDownItems.indexOf(items) % 2 == 0 ? 100 : 0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      items, //['department_name'],
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        textStyle: TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            log(' store drop down value: ${newValue.runtimeType}');
            onChangeValue(newValue);
          }),
    );
  }
}
