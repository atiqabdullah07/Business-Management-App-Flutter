import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/colors.dart';

class StaticDropDown extends StatefulWidget {
  StaticDropDown({
    Key? key,
    required this.width,
    required this.initialValue,
    required this.dropDownItems,
    this.isSecondText,
    this.isIconEnabled,
    required this.isAlternativeColor,
    required this.onChangeValue,
    this.backgroundColor = AppColors.tertiary,
    this.textColor = Colors.white,
    this.dropdownHeight,
  }) : super(key: key);

  final double width;
  final String initialValue;
  final List<String> dropDownItems;
  final bool? isSecondText;
  final bool? isIconEnabled;
  final bool? isAlternativeColor;
  final Function onChangeValue;
  double? dropdownHeight;
  Color? backgroundColor;
  Color? textColor;

  @override
  _StaticDropDownState createState() => _StaticDropDownState();
}

class _StaticDropDownState extends State<StaticDropDown> {
  String initialValue = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
          buttonPadding:
              EdgeInsets.only(left: 10.w, right: 6.w, top: 5.h, bottom: 5.h),
          itemPadding: const EdgeInsets.symmetric(horizontal: 8),
          buttonDecoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          dropdownDecoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(17.r),
            ),
          ),
          dropdownMaxHeight: widget.dropdownHeight,
          buttonHeight: 35.h,
          buttonWidth: widget.width,
          style: TextStyle(
            color: widget.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
          ),
          hint: Text(
            widget.initialValue,
            style: TextStyle(color: widget.textColor),
          ),
          iconOnClick: Icon(
            Icons.keyboard_arrow_up_outlined,
            color: widget.textColor,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: widget.textColor,
          ),
          itemHeight: 35.h,
          items: widget.dropDownItems.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: AppText(
                  title: value,
                  color: widget.textColor,
                  size: 10.sp,
                  fontWeight: FontWeight.w500),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              initialValue = newValue.toString();
            });
            log(newValue.toString());
            widget.onChangeValue(newValue.toString());
          }),
    );
  }
}
