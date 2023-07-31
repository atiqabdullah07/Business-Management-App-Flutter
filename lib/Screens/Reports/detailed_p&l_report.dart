import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/HelperFunctions/alert_functions.dart';
import 'package:smokin_joes/WebHandler/DashboardController.dart';
import 'package:smokin_joes/WebHandler/ReportController/detailed_p&l_controller.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/CARD3.dart';

import '../../Widgets/Button.dart';
import '../../Widgets/DropDown/store_drop_down.dart';
import '../../Widgets/Tables/Reports/detailed_p&l_report_table.dart';
import '../../Widgets/custom_date_picker.dart';
import '../../Widgets/stack_design.dart';

class DetailedPLReport extends GetView<DetailedPLReportController> {
  DetailedPLReport({Key? key}) : super(key: key);
  final DashboardController dashboardController = Get.find();

  DateFormat dateFormatter = DateFormat('yyyy-MM');

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
        () => controller.isLoading.value == true
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const CARD3(
                      ImagePath: 'Images/Group 238.svg',
                      title: 'Detailed P&L',
                      subTitle: 'Report',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: AppText(
                              title: 'Store',
                              color: Colors.black,
                              size: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          StoreDropDown(
                            initialValue: controller.selectedStoreName.value !=
                                    ''
                                ? controller.selectedStoreName.value
                                : dashboardController.storeName[0].toString(),
                            width: 1.sw,
                            dropDownItems: dashboardController.storeName,
                            isAlternativeColor: true,
                            onChangeValue: (value) {
                              controller.findStoreId(value);
                              controller.selectedStoreName.value = value;
                              log('value from selected store dropdown: $value');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: AppText(
                                    title: 'From Month',
                                    color: Colors.black,
                                    size: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                CustomDatePicker(
                                  dateTime: controller.startDate != null
                                      ? dateFormatter
                                          .format(controller.startDate!)
                                          .toString()
                                      : '',
                                  dateCallBack: (date) {
                                    controller.updateStartDate(date);
                                    log('print start date: ${controller.startDate}');
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.w),
                                  child: AppText(
                                    title: 'To Month',
                                    color: Colors.black,
                                    size: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                CustomDatePicker(
                                  dateTime: controller.endDate != null
                                      ? dateFormatter
                                          .format(controller.endDate!)
                                          .toString()
                                      : '',
                                  dateCallBack: (date) {
                                    controller.updateEndDate(date);
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          AppButton(
                            width: 80.w,
                            title: 'Search',
                            voidCallback: () {
                              if (controller.startDate == null ||
                                  controller.endDate == null) {
                                AlertFunctions.warningSnackBar(
                                    'One of the field is empty',
                                    'Please select');
                              } else {
                                controller.getDetailedPLReport(
                                  departmentId: controller.departmentId != null
                                      ? controller.departmentId!
                                      : '2',
                                  startDate: dateFormatter
                                      .format(controller.startDate!),
                                  endDate:
                                      dateFormatter.format(controller.endDate!),
                                );
                              }
                            },
                            hight: 35.h,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w, right: 14.w),
                      child: DetailedPLReportTable(
                        month: controller.startDate != null
                            ? DateFormat('dd/MMM/yyyy')
                                .format(
                                  controller.startDate!,
                                )
                                .toString()
                            : '',
                        firstHeading: 'Head',
                        secondHeading: 'Month',
                        thirdHeading: 'Amount (\$)',
                        tableRowsList:
                            DetailedReportTableList.detailedReportTableList,
                        secondHeaderWidth: 0.4,
                        secondRowWidth: 0.4,
                        thirdHeaderWidth: 0.4,
                        thirdRowWidth: 0.4,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    //total of first Table
                    const StackDesign(text1: 'Total', text2: '18891.2'),
                    //Checque Debit
                    controller.detailedDebitPLReportList.isNotEmpty
                        ? Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 50.h, bottom: 30.h),
                                child: AppText(
                                    title: 'Cheque Debit (-)',
                                    color: AppColors.secondary,
                                    size: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),

                              //checque debit table
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 14.w, right: 14.w),
                                child: DetailedPLReportTable(
                                  month: controller.endDate != null
                                      ? DateFormat('dd/MMM/yyyy')
                                          .format(
                                            controller.endDate!,
                                          )
                                          .toString()
                                      : '',
                                  firstHeading: 'Head',
                                  secondHeading: 'Month',
                                  thirdHeading: 'Amount (\$)',
                                  tableRowsList: controller
                                      .detailedDebitPLReportList[0].data,
                                  secondHeaderWidth: 0.4,
                                  secondRowWidth: 0.4,
                                  thirdHeaderWidth: 0.4,
                                  thirdRowWidth: 0.4,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              //total of cheque debit table Table
                              const StackDesign(
                                  text1: 'Total', text2: '4517.41'),
                            ],
                          )
                        : const SizedBox(),
                    //Checque Credit table
                    controller.detailedCreditPLReportList.isNotEmpty
                        ? Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 50.h, bottom: 30.h),
                                child: AppText(
                                    title: 'Cheque Credit (+)',
                                    color: AppColors.secondary,
                                    size: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              //checque credit table
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 14.w, right: 14.w),
                                child: DetailedPLReportTable(
                                  month: controller.startDate != null
                                      ? DateFormat('dd/MMM/yyyy')
                                          .format(
                                            controller.startDate!,
                                          )
                                          .toString()
                                      : '',
                                  firstHeading: 'Head',
                                  secondHeading: 'Month',
                                  thirdHeading: 'Amount (\$)',
                                  tableRowsList: controller
                                      .detailedCreditPLReportList[0].data,
                                  secondHeaderWidth: 0.4,
                                  secondRowWidth: 0.4,
                                  thirdHeaderWidth: 0.4,
                                  thirdRowWidth: 0.4,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              //total of cheque credit table Table
                              const StackDesign(
                                  text1: 'Total', text2: '179872.16'),
                              SizedBox(height: 15.h),
                              //total P&L
                            ],
                          )
                        : const SizedBox(),
                    //total P&L
                    const StackDesign(text1: 'Total P&L', text2: '7769.45'),
                    SizedBox(height: 70.h),
                  ],
                ),
              ),
      ),
    );
  }
}
