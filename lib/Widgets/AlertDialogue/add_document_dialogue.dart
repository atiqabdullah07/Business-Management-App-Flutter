import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Widgets/DropDown/custom_drop_down.dart';

import '../../Constants/colors.dart';
import '../Button.dart';
import '../custom_date_picker.dart';

class AddDocumentDialogue extends StatelessWidget {
  const AddDocumentDialogue({
    Key? key,
    required this.cancelCallBack,
    required this.saveCallBack,
  }) : super(key: key);
  final VoidCallback cancelCallBack;
  final Function saveCallBack;

  Future _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    /*if (_pickedFile != null) {
      File imageFile = new File(_pickedFile.path);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      insetPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 40.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 50.h),
      // buttonPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: AppColors.background,
      title: const AppText(
        title: 'Upload Document',
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 35.h,
                    width: 170.w,
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
                          hintText: 'Enter Title',
                          hintStyle: TextStyle(
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                CustomDatePicker(
                  dateTime: '',
                  width: 150.w,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CustomDropDown(
              width: 1.sw,
              dropDownItems: filter.vendorItems,
              isAlternativeColor: true,
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _getFromGallery();
                    },
                    child: Container(
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                color: Colors.grey.shade300,
                                padding: EdgeInsets.symmetric(horizontal: 0.w),
                                child: Center(
                                  child: AppText(
                                      title: 'Choose',
                                      color: AppColors.secondary,
                                      size: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          AppText(
                            title: 'No File Choosen',
                            color: AppColors.secondary,
                            size: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
