import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/Widgets/AlertDialogue/edit_vendors.dart';
import 'package:smokin_joes/WebHandler/vendors_controller.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/Card2.dart';
import 'package:smokin_joes/Widgets/Tables/view_vendors_table.dart';

import '../Widgets/Button.dart';

class ViewVendors extends GetView<VendorsController> {
  ViewVendors({Key? key}) : super(key: key);

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
        () => controller.viewVendorsList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const CARD2(
                      ImagePath: "Images/Group 338.svg",
                      title: 'View Vendors',
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
                            width: 190.w,
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
                                  hintText: 'Search Here',
                                  hintStyle: TextStyle(
                                    fontSize: 11.sp,
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
                                width: 100.w,
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
                      child: ViewVendorsTable(
                        firstHeading: '#',
                        secondHeading: 'Name',
                        thirdHeading: 'Vendor Type',
                        fourthHeading: 'Business',
                        fifthHeading: 'Action',
                        tableRowsLit: controller.viewVendorsList,
                        firstHeaderWidth: 0.5,
                        firstRowWidth: 0.5,
                        voidCallback: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const EditVendorsDialogue();
                              });
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
