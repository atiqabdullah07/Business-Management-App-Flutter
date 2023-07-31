import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smokin_joes/Constants/colors.dart';

class MappingSettingDropDown extends StatefulWidget {
  const MappingSettingDropDown({
    Key? key,
    required this.width,
    required this.dropDownItems,
    this.isSecondText,
    this.isIconEnabled,
    required this.isAlternativeColor,
  }) : super(key: key);

  final double width;
  final List dropDownItems;
  final bool? isSecondText;
  final bool? isIconEnabled;
  final bool? isAlternativeColor;

  @override
  _MappingSettingDropDownState createState() => _MappingSettingDropDownState();
}

class _MappingSettingDropDownState extends State<MappingSettingDropDown> {
  String initialValue = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
          isExpanded: true,
          buttonHeight: 35.h,
          itemPadding: const EdgeInsets.symmetric(horizontal: 8),
          buttonWidth: widget.width,
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
          value: initialValue != '' ? initialValue : widget.dropDownItems[0],
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.secondary,
          ),
          items: widget.dropDownItems.map((items) {
            return DropdownMenuItem(
              value: items['vendor_type'],
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                // height: 27.h,
                // width: 400.w,
                decoration: BoxDecoration(
                  color: widget.dropDownItems.indexOf(items) % 2 == 0
                      ? (widget.isAlternativeColor == true
                          ? const Color(0xffF5F5F5)
                          : Colors.transparent)
                      : Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                        widget.dropDownItems.indexOf(items) % 2 == 0 ? 100 : 0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      items['vendor_type'],
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
            setState(() {
              initialValue = newValue.toString();
            });
            Get.snackbar('title', newValue.toString());
          }),
    );
  }
}
