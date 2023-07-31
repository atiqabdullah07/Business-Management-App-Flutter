import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/WebHandler/business_controller.dart';
import 'package:smokin_joes/Widgets/AlertDialogue/update_business.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/Card2.dart';

import '../Widgets/Button.dart';
import '../Widgets/Tables/View_Business_Table.dart';

class View_Business extends GetView<BusinessController> {
  View_Business({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      key: _key,
      appBar: APPBAR(
        ontap: () {
          _key.currentState!.openDrawer();
        },
      ),
      drawer: const AppDrawer(),
      body: Obx(
        () => controller.viewBusinessList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const CARD2(
                      ImagePath: "Images/Group 338.svg",
                      title: 'View Business',
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Row(
                        children: [
                          Container(
                            height: 35.h,
                            width: 170.w,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
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
                                    hintText: 'Search Here',
                                    hintStyle: TextStyle(
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          AppButton(
                              width: 95.w,
                              hight: 35.h,
                              fontSize: 10,
                              title: 'Pdf Export',
                              voidCallback: () {}),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: AppButton(
                                width: 113.w,
                                hight: 35.h,
                                fontSize: 10,
                                title: 'Send to Email',
                                voidCallback: () {}),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w, right: 14.w),
                      child: BusinessTable(
                        firstHeading: '#',
                        secondHeading: 'Name',
                        thirdHeading: 'Category',
                        fourthHeading: 'City, State',
                        fifthHeading: 'Corporation',
                        sixthHeading: 'Action',
                        tableRowsLit: controller.viewBusinessList,
                        firstHeaderWidth: 0.6,
                        firstRowWidth: 0.6,
                        viewCallBack: (updateValue) {
                          log('Update Value: ${updateValue.corporation}');
                          controller.id = updateValue.id.toString();
                          controller.updateBusinessNameController.text =
                              updateValue.name.toString();
                          controller.updateBusinesscityController.text =
                              updateValue.city.toString();
                          controller.updateBusinessstateController.text =
                              updateValue.state.toString();
                          controller.updateBusinesscorporationController.text =
                              updateValue.corporation.toString();
                          controller.businessUpdateInitialValue.value =
                              updateValue.category.toString();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Obx(
                                () => UpdateBusiness(
                                  initialValue: controller
                                      .businessUpdateInitialValue.value,
                                  cancelCallBack: () {},
                                  saveCallBack: () {},
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 70.h),
                  ],
                ),
              ),
      ),
    );
  }
}
