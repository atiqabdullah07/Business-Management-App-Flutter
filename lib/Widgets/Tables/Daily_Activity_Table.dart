import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/colors.dart';

class DailyActivityTable extends StatelessWidget {
  const DailyActivityTable({
    Key? key,
    required this.tableRowsLit,
    required this.firstHeading,
    required this.secondHeading,
    required this.thirdHeading,
    required this.fourthHeading,
    this.firstHeaderWidth,
    this.secondHeaderWidth,
    this.thirdHeaderWidth,
    this.fourthHeaderWidth,
    this.firstRowWidth,
    this.secondRowWidth,
    this.thirdRowWidth,
    this.fourthRowWidth,
  }) : super(key: key);

  final List tableRowsLit;
  final String firstHeading;
  final String secondHeading;
  final String thirdHeading;
  final String fourthHeading;

  //header width
  final double? firstHeaderWidth;
  final double? secondHeaderWidth;
  final double? thirdHeaderWidth;
  final double? fourthHeaderWidth;

  //rows widht
  final double? firstRowWidth;
  final double? secondRowWidth;
  final double? thirdRowWidth;
  final double? fourthRowWidth;
  // Color colorFilter
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
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 15.w,
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
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 0.h, horizontal: 5.w),
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 3.w,
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
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 3.w,
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
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 5.w,
                    ),
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 3.w,
                      right: 15.w,
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
              },

              //if data is loaded then show table
              children: List<TableRow>.generate(
                tableRowsLit.length,
                (index) =>
                    //display data dynamically from namelist List.
                    TableRow(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: tableRowsLit[index]['HEAD'].contains('Total')
                        ? AppColors.primary
                        : Colors.transparent,
                  ),
                  //return table row in every loop
                  children: [
                    //table cells inside table row
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 5.w),
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          left: 15.w,
                        ),
                        child: AppText(
                          title: tableRowsLit[index]['HEAD'].toString(),
                          color: AppColors.secondary,
                          size: 8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 5.w),
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          left: 3.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: TextFormField(
                          enabled: tableRowsLit[index]['HEAD'].contains('Total')
                              ? false
                              : true,
                          style: GoogleFonts.manrope(
                            textStyle: TextStyle(fontSize: 12.sp),
                          ),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 5.w),
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          left: 3.w,
                        ),
                        child: AppText(
                          title: tableRowsLit[index]['AMOUNT'].toString(),
                          color: AppColors.secondary,
                          size: 8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 5.w),
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.h,
                          left: 3.w,
                          right: 15.w,
                        ),
                        child: AppText(
                          title: tableRowsLit[index]['YEAR_TOTAL'].toString(),
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
        ),
      ],
    );
  }
}
