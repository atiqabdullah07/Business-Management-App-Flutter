import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/AppText.dart';

import '../../Constants/colors.dart';
import '../Button.dart';

class EditVendorsDialogue extends StatefulWidget {
  static bool cpaCheckValue = false;
  static bool reportCheckValue = false;
  const EditVendorsDialogue({
    Key? key,
  }) : super(key: key);

  @override
  State<EditVendorsDialogue> createState() => _EditVendorsDialogueState();
}

class _EditVendorsDialogueState extends State<EditVendorsDialogue> {
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
        title: 'Edit Vendor',
        color: AppColors.secondary,
        size: 16,
        fontWeight: FontWeight.w500,
        isTextAlign: true,
      ),
      // titlePadding: EdgeInsets.only(left: 110.w, top: 20.h),
      content: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Expanded(
              child: Container(
                height: 35.h,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Center(
                  child: TextField(
                    style: TextStyle(fontSize: 11.sp),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      border: InputBorder.none,
                      hintText: 'Vendor Name',
                      hintStyle: TextStyle(
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Expanded(
              child: Container(
                height: 35.h,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Center(
                  child: TextField(
                    style: TextStyle(fontSize: 11.sp),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      border: InputBorder.none,
                      hintText: 'Vendor Type',
                      hintStyle: TextStyle(
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          CheckboxListTile(
            title: const AppText(
                title: 'Cpa',
                color: Colors.black,
                size: 15,
                fontWeight: FontWeight.w500),
            value: EditVendorsDialogue.cpaCheckValue,
            onChanged: (newValue) {
              setState(() {
                EditVendorsDialogue.cpaCheckValue = newValue!;
              });
            },
          ),
          CheckboxListTile(
            title: const AppText(
                title: 'Report',
                color: Colors.black,
                size: 15,
                fontWeight: FontWeight.w500),
            value: EditVendorsDialogue.reportCheckValue,
            onChanged: (newValue) {
              setState(() {
                EditVendorsDialogue.reportCheckValue = newValue!;
              });
            },
          ),
          SizedBox(height: 15.h),
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
                  title: 'Save',
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
