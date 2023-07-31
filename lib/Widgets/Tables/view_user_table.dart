import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/image_constant.dart';

import '../../Constants/colors.dart';

class ViewUserTable extends StatelessWidget {
  const ViewUserTable({
    Key? key,
    required this.tableRowsLit,
    required this.firstHeading,
    required this.secondHeading,
    required this.thirdHeading,
    required this.fourthHeading,
    required this.fifthHeading,
    required this.sixthHeading,
    required this.sevenHeading,
    this.firstHeaderWidth,
    this.secondHeaderWidth,
    this.thirdHeaderWidth,
    this.fourthHeaderWidth,
    this.fifthHeaderWidth,
    this.sixthHeaderWidth,
    this.sevenHeaderWidth,
    this.firstRowWidth,
    this.secondRowWidth,
    this.thirdRowWidth,
    this.fourthRowWidth,
    this.fifthRowWidth,
    this.sixthRowWidth,
    this.sevenRowWidth,
    required this.voidCallback_1,
    required this.voidCallback_2,
  }) : super(key: key);

  final List tableRowsLit;
  final String firstHeading;
  final String secondHeading;
  final String thirdHeading;
  final String fourthHeading;
  final String fifthHeading;
  final String sixthHeading;
  final String sevenHeading;

  //header width
  final double? firstHeaderWidth;
  final double? secondHeaderWidth;
  final double? thirdHeaderWidth;
  final double? fourthHeaderWidth;
  final double? fifthHeaderWidth;
  final double? sixthHeaderWidth;
  final double? sevenHeaderWidth;

  //rows widht
  final double? firstRowWidth;
  final double? secondRowWidth;
  final double? thirdRowWidth;
  final double? fourthRowWidth;
  final double? fifthRowWidth;
  final double? sixthRowWidth;
  final double? sevenRowWidth;

  final Function voidCallback_1;
  final Function voidCallback_2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          columnWidths: {
            0: firstHeaderWidth != null
                ? FlexColumnWidth(firstHeaderWidth!)
                : const FlexColumnWidth(),
            1: secondHeaderWidth != null
                ? FlexColumnWidth(secondHeaderWidth!)
                : const FlexColumnWidth(),
            2: thirdHeaderWidth != null
                ? FlexColumnWidth(thirdHeaderWidth!)
                : const FlexColumnWidth(),
            3: fourthHeaderWidth != null
                ? FlexColumnWidth(fourthHeaderWidth!)
                : const FlexColumnWidth(),
            4: fifthHeaderWidth != null
                ? FlexColumnWidth(fifthHeaderWidth!)
                : const FlexColumnWidth(),
            5: sixthHeaderWidth != null
                ? FlexColumnWidth(sixthHeaderWidth!)
                : const FlexColumnWidth(),
            6: sevenHeaderWidth != null
                ? FlexColumnWidth(sevenHeaderWidth!)
                : const FlexColumnWidth(),
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
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 3.w,
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        title: firstHeading,
                        color: Colors.white,
                        size: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 3.w,
                      right: 3.w,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        title: secondHeading,
                        color: Colors.white,
                        size: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 3.w,
                      right: 3.w,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        title: thirdHeading,
                        color: Colors.white,
                        size: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 3.w,
                      right: 3.w,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        title: fourthHeading,
                        color: Colors.white,
                        size: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 3.w,
                      right: 3.w,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        title: fifthHeading,
                        color: Colors.white,
                        size: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 3.w,
                      right: 3.w,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        title: sixthHeading,
                        color: Colors.white,
                        size: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      right: 20.w,
                      left: 3.w,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        title: sevenHeading,
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
        SizedBox(
          height: 400.h,
          child: SingleChildScrollView(
            child: Table(
              columnWidths: {
                0: firstRowWidth != null
                    ? FlexColumnWidth(firstRowWidth!)
                    : const FlexColumnWidth(),
                1: secondRowWidth != null
                    ? FlexColumnWidth(secondRowWidth!)
                    : const FlexColumnWidth(),
                2: thirdRowWidth != null
                    ? FlexColumnWidth(thirdRowWidth!)
                    : const FlexColumnWidth(),
                3: fourthRowWidth != null
                    ? FlexColumnWidth(fourthRowWidth!)
                    : const FlexColumnWidth(),
                4: fifthRowWidth != null
                    ? FlexColumnWidth(fifthRowWidth!)
                    : const FlexColumnWidth(),
                5: sixthRowWidth != null
                    ? FlexColumnWidth(sixthRowWidth!)
                    : const FlexColumnWidth(),
                6: sevenRowWidth != null
                    ? FlexColumnWidth(sevenRowWidth!)
                    : const FlexColumnWidth(),
              },

              //if data is loaded then show table
              children: List<TableRow>.generate(
                tableRowsLit.length,
                (index) =>
                    //display data dynamically from namelist List.
                    TableRow(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:
                        index % 2 == 0 ? AppColors.primary : Colors.transparent,
                  ),
                  //return table row in every loop
                  children: [
                    //table cells inside table row
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 3.w,
                          top: 10.h,
                          bottom: 10.h,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            title: (index + 1).toString(),
                            color: AppColors.secondary,
                            size: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          left: 3.w,
                          right: 3.w,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            title: tableRowsLit[index]['name'].toString(),
                            color: AppColors.secondary,
                            size: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          left: 3.w,
                          right: 3.w,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            title: tableRowsLit[index]['email'].toString(),
                            color: AppColors.secondary,
                            size: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          left: 3.w,
                          right: 3.w,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            title: tableRowsLit[index]['department_name']
                                .toString(),
                            color: AppColors.secondary,
                            size: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          left: 3.w,
                          right: 3.w,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            title: tableRowsLit[index]['created_at'] ?? '',
                            color: AppColors.secondary,
                            size: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          right: 20.w,
                          left: 3.w,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(
                            title:
                                tableRowsLit[index]['user_privileges'] == null
                                    ? 'All'
                                    : tableRowsLit[index]['user_privileges']
                                        .toString(),
                            color: AppColors.secondary,
                            size: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          //right: 20.w,
                          left: 3.w,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    voidCallback_1(tableRowsLit[index]);
                                  },
                                  child: Image.asset(
                                    ImageConstant.editUser,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    voidCallback_2(tableRowsLit[index]);
                                  },
                                  child: Image.asset(
                                    ImageConstant.deleteUser,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
