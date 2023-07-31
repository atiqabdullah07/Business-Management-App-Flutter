import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/AppText.dart';
import '../../Constants/colors.dart';
import '../Button.dart';

class AddVendorDialogue extends StatelessWidget {
  const AddVendorDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      insetPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 40.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 50.h),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: AppColors.background,
      title: const AppText(
        title: 'Add Vendor',
        color: AppColors.secondary,
        size: 16,
        fontWeight: FontWeight.w500,
        isTextAlign: true,
      ),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const DialogueTextField(
                  hintText: 'Enter Vendor Name',
                ),
                SizedBox(
                  height: 30.h,
                ),
                const DialogueTextField(
                  hintText: 'Enter Vendor Type',
                ),
              ],
            ),
          ),
          SizedBox(height: 45.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5.w,
                ),
                AppButton(
                  width: 90.w,
                  title: 'Cancel',
                  voidCallback: () {
                    Navigator.of(context).pop(true);
                  },
                  hight: 35.h,
                  fontSize: 12.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                AppButton(
                  width: 90.w,
                  title: 'Send',
                  voidCallback: () {},
                  hight: 35.h,
                  fontSize: 12.sp,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DialogueTextField extends StatelessWidget {
  final String hintText;

  const DialogueTextField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(100.r),
        ),
      ),
      child: Center(
        child: TextField(
          style: GoogleFonts.manrope(
            textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.manrope(
              textStyle: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
