import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/WebHandler/business_controller.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/Button.dart';

import '../Constants/colors.dart';
import '../Widgets/CARD3.dart';
import '../Widgets/DropDown/static_drop_down.dart';

class AddBusiness extends GetView<BusinessController> {
  const AddBusiness({Key? key}) : super(key: key);

  // static final GlobalKey<ScaffoldState> _key1 = GlobalKey<ScaffoldState>();

  Future _getFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    controller.imagePath = image!.path;
    log('\n\nselected image: ${image.path}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: _key1,
      appBar: APPBAR(
        ontap: () {
          //     _key1.currentState!.openDrawer();
        },
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
          child: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              const CARD3(
                ImagePath: 'Images/Group 562.svg',
                title: 'Add',
                subTitle: 'Business',
              ),
              SizedBox(
                height: 50.h,
              ),
              AddBusinessTextField(
                controller: controller.businessNameController,
                title: 'Business Name',
                hintText: 'Enter Business Name',
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        title: 'Category',
                        color: AppColors.secondary,
                        size: 10.sp,
                        fontWeight: FontWeight.w500),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Expanded(
                          child: StaticDropDown(
                            initialValue:
                                controller.categoryDropDownValue.value,
                            backgroundColor: AppColors.primary,
                            textColor: Colors.black,
                            width: 0,
                            dropDownItems: filter.category,
                            isAlternativeColor: false,
                            onChangeValue: (value) {
                              controller.categoryDropDownValue.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              AddBusinessTextField(
                controller: controller.stateController,
                title: 'State',
                hintText: 'Enter State Name',
              ),
              SizedBox(
                height: 20.h,
              ),
              AddBusinessTextField(
                controller: controller.cityController,
                title: 'City',
                hintText: 'Enter City Name',
              ),
              SizedBox(
                height: 20.h,
              ),
              AddBusinessTextField(
                controller: controller.corporationController,
                title: 'Corporation Name',
                hintText: 'Enter Corporation Name',
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 12.w,
                        ),
                        AppText(
                            title: 'Business Image',
                            color: AppColors.secondary,
                            size: 12.sp,
                            fontWeight: FontWeight.w500)
                      ],
                    ),
                    Row(
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
                                    width: 20.w,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                          color: Colors.grey.shade300,
                                          width: 90,
                                          child: Center(
                                            child: AppText(
                                                title: 'Choose File',
                                                color: AppColors.secondary,
                                                size: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  AppText(
                                      title: 'No File Choosen',
                                      color: AppColors.secondary,
                                      size: 12.sp,
                                      fontWeight: FontWeight.w500),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        AppButton(
                            width: 90.w,
                            title: 'Save',
                            voidCallback: () {
                              //  log('/n/nBusiness Name: ${controller.businessNameController}\nState Controller: ${controller.stateController}\nCity Controller: ${controller.cityController}\nCorporation Controller: ${controller.corporationController}\n');
                              controller.insertBusiness();
                              // print(controller.imagePath);
                            },
                            hight: 35.h,
                            fontSize: 12.sp)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class AddBusinessTextField extends StatelessWidget {
  final String title;
  final String hintText;

  const AddBusinessTextField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 12.w,
          ),
          AppText(
              title: title,
              color: AppColors.secondary,
              size: 10.sp,
              fontWeight: FontWeight.w500),
          SizedBox(height: 5.h),
          Container(
            height: 35.h,
            width: 1.sw,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(50.r),
              ),
            ),
            child: Center(
              child: TextField(
                controller: controller,
                style: GoogleFonts.manrope(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w500),
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
                    textStyle:
                        TextStyle(fontSize: 12.sp, color: AppColors.secondary),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
