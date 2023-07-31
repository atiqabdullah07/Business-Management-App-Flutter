import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/HelperFunctions/HelperFunctions.dart';
import 'package:smokin_joes/WebHandler/invoice_controller.dart';
import 'package:smokin_joes/Widgets/DropDown/static_drop_down.dart';

import '../../Constants/colors.dart';
import '../Button.dart';
import '../custom_date_picker.dart';

class AddInvoiceDialogue extends StatelessWidget {
  final InvoiceController invoiceController = Get.put(InvoiceController());

  AddInvoiceDialogue({
    Key? key,
    required this.saveCallBack,
  }) : super(key: key);

  final Function saveCallBack;

  Future _getFromGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final List<XFile>? pickedFile = await picker.pickMultiImage();
    if (pickedFile!.isNotEmpty) {
      invoiceController.imageFileList!.addAll(pickedFile);

      for (int i = 0; i < invoiceController.imageFileList!.length; i++) {
        invoiceController.imagePathList
            .add(invoiceController.imageFileList!.elementAt(i).path);
      }
    }
  }

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
          title: 'Add invoice',
          color: AppColors.secondary,
          size: 16,
          fontWeight: FontWeight.w500,
          isTextAlign: true,
        ),
        content: Obx(
          () => Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomDatePicker(
                        dateTime: invoiceController.selectedDate.value,
                        //
                        dateCallBack: (date) {
                          invoiceController.selectedDate.value =
                              DateFormat('yyyy-MM-dd').format(date);
                        },
                        width: 150.w,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: StaticDropDown(
                    width: 1.sw,
                    backgroundColor: AppColors.primary,
                    textColor: Colors.black,
                    dropdownHeight: 0.4.sh,
                    initialValue: invoiceController
                                .selectedItemFromAddInvoiceDialogue.value ==
                            ''
                        ? invoiceController.vendorDropDownItems[0].toString()
                        : invoiceController
                            .selectedItemFromAddInvoiceDialogue.value,
                    dropDownItems: invoiceController.vendorDropDownItems,
                    isAlternativeColor: false,
                    onChangeValue: (value) {
                      invoiceController
                          .selectedItemFromAddInvoiceDialogue.value = value;

                      InvoiceFunction.findVendorId(value);
                    },
                  )),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GestureDetector(
                  onTap: () {
                    invoiceController.imageFileList!.clear();
                    invoiceController.imagePathList.clear();
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
                          title: invoiceController.imagePathList.isEmpty
                              ? 'No File Choosen'
                              : '${invoiceController.imagePathList.length.toString()} Files Selected',
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
                      voidCallback: () {
                        saveCallBack();
                      },
                      hight: 35.h,
                      fontSize: 12.sp,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
