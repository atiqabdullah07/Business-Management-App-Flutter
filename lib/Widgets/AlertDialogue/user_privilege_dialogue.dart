import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/WebHandler/user_controller.dart';
import 'package:smokin_joes/Widgets/DropDown/static_drop_down.dart';

import '../../Constants/AppText.dart';
import '../../Constants/colors.dart';
import '../Button.dart';

class EditUserPrivilegeDialogue extends StatelessWidget {
  EditUserPrivilegeDialogue({Key? key}) : super(key: key);
  final UsersController usersController = Get.find();

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
        title: 'User Privilege',
        color: AppColors.secondary,
        size: 16,
        fontWeight: FontWeight.w500,
        isTextAlign: true,
      ),
      content: Obx(
        () => Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: StaticDropDown(
                  width: 1.sw,
                  initialValue: usersController.privilegeDropDownValue.value,
                  dropDownItems: filter.userPrivilege,
                  isAlternativeColor: false,
                  onChangeValue: usersController.privilegeDropDownValue,
                  backgroundColor: AppColors.primary,
                  textColor: Colors.black,
                )),
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
                      usersController.editUserPrivilege(
                          id: usersController.id,
                          privilege: usersController
                                      .privilegeDropDownValue.value ==
                                  'Edit'
                              ? null
                              : usersController.privilegeDropDownValue.value);
                      //  log('Id at the Index: ${usersController.id}');
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
