import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect/multiselect.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/WebHandler/user_controller.dart';

import '../../Constants/colors.dart';
import '../../WebHandler/DashboardController.dart';
import '../Button.dart';

class EditUserDialogue extends StatelessWidget {
  EditUserDialogue({
    Key? key,
    required this.selectedStoreCallBack,
    required this.selectedValue,
    required this.updateCallBack,
  }) : super(key: key);
  List<String> selectedValue;
  final Function selectedStoreCallBack;
  final DashboardController controller = Get.find();
  final UsersController userController = Get.find();
  final Function updateCallBack;

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
        title: 'Edit Business',
        color: AppColors.secondary,
        size: 16,
        fontWeight: FontWeight.w500,
        isTextAlign: true,
      ),
      content: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 200.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: AppColors.tertiary, width: 1.5)),
                      child: SingleChildScrollView(
                        child: DropDownMultiSelect(
                          isDense: false,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30.r,
                            color: AppColors.tertiary,
                          ),
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          hintStyle: GoogleFonts.manrope(
                              textStyle: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            overflow: TextOverflow.fade,
                          )),
                          onChanged: (value) {
                            //   selectedStoreCallBack(value);

                            selectedValue = value;
                            userController.selectedStore = value;
                          },
                          options: controller.storeName,
                          selectedValues: selectedValue,
                          whenEmpty: 'Empty',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                    title: 'Update',
                    voidCallback: () {
                      updateCallBack();
                    },
                    hight: 35.h,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
