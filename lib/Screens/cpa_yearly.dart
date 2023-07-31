import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/Card2.dart';
import 'package:smokin_joes/Widgets/DropDown/custom_drop_down.dart';

class CpaYearly extends StatefulWidget {
  const CpaYearly({Key? key}) : super(key: key);

  @override
  _CpaYearlyState createState() => _CpaYearlyState();
}

class _CpaYearlyState extends State<CpaYearly> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  String yearDropDownValue = 'Select Year';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: APPBAR(
        ontap: () {
          _key.currentState!.openDrawer();
        },
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          color: AppColors.background,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CARD2(
                  ImagePath: 'Images/Group 486.svg',
                  title: 'CPA - Yearly',
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    children: [
                      CustomDropDown(
                        dropDownItems: filter.items,
                        width: 250.w,
                        isSecondText: true,
                        isAlternativeColor: true,
                      ),
                      const SizedBox(width: 10),
                      // year drop down
                      Expanded(
                        child: CustomDropDown(
                          dropDownItems: filter.yearItems,
                          width: 100.w,
                          isSecondText: false,
                          isAlternativeColor: false,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1.2),
                      1: FlexColumnWidth(0.4)
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.tertiary),
                        //return table row in every loop
                        children: [
                          //table cells inside table row
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: const AppText(
                                title: 'VendorType',
                                color: Colors.white,
                                size: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: const AppText(
                                title: 'Year',
                                color: Colors.white,
                                size: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: const AppText(
                                title: 'Total Deposit (\$)',
                                color: Colors.white,
                                size: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                bottom: 10.h,
                                right: 20.w,
                              ),
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: AppText(
                                  title: 'Total Credit (\$)',
                                  color: Colors.white,
                                  size: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //example table
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1.2),
                      1: FlexColumnWidth(0.4)
                    },

                    //if data is loaded then show table
                    children: List<TableRow>.generate(
                      filter.yearlyTable.length,
                      (index) =>
                          //display data dynamically from namelist List.
                          TableRow(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: index % 2 == 0
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                        //return table row in every loop
                        children: [
                          //table cells inside table row
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: AppText(
                                title: filter.yearlyTable[index]['VENDER_TYPE']
                                    .toString(),
                                color: AppColors.secondary,
                                size: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: AppText(
                                title: filter.yearlyTable[index]['YEAR']
                                    .toString(),
                                color: AppColors.secondary,
                                size: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              child: AppText(
                                title: filter.yearlyTable[index]
                                        ['TOTAL_DEPOSIT']
                                    .toString(),
                                color: AppColors.secondary,
                                size: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                bottom: 10.h,
                                right: 20.w,
                              ),
                              child: AppText(
                                title: filter.yearlyTable[index]
                                        ['TOTAL_CREATED']
                                    .toString(),
                                color: AppColors.secondary,
                                size: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
