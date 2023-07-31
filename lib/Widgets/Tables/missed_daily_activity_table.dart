import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/AppText.dart';

import '../../Constants/colors.dart';

class MissedDailyAvtivityDataTable extends StatelessWidget {
  const MissedDailyAvtivityDataTable({
    Key? key,
    required this.tableRowsLit,
    required this.firstHeading,
    required this.secondHeading,
    required this.thirdHeading,
    this.firstHeaderWidth,
    this.secondHeaderWidth,
    this.thirdHeaderWidth,
    this.firstRowWidth,
    this.secondRowWidth,
    this.thirdRowWidth,
    this.fourthRowWidth,
  }) : super(key: key);

  final List tableRowsLit;
  final String firstHeading;
  final String secondHeading;
  final String thirdHeading;

  //header width
  final double? firstHeaderWidth;
  final double? secondHeaderWidth;
  final double? thirdHeaderWidth;

  //rows widht
  final double? firstRowWidth;
  final double? secondRowWidth;
  final double? thirdRowWidth;
  final double? fourthRowWidth;

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
                      right: 3.w,
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    child: AppText(
                      title: firstHeading,
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
                      left: 50.w,
                      right: 3.w,
                    ),
                    child: AppText(
                      title: secondHeading,
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
                      left: 70.w,
                      right: 3.w,
                    ),
                    child: AppText(
                      title: thirdHeading,
                      color: Colors.white,
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 350.h,
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
                    color:
                        index % 2 == 0 ? AppColors.primary : Colors.transparent,
                  ),
                  //return table row in every loop
                  children: [
                    //table cells inside table row
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 3.w,
                          top: 10.h,
                          bottom: 10.h,
                        ),
                        child: AppText(
                          title: tableRowsLit[index]['Date'].toString(),
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
                          left: 50.w,
                          right: 3.w,
                        ),
                        child: AppText(
                          title: tableRowsLit[index]['Month'].toString(),
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
                          left: 70.w,
                          right: 3.w,
                        ),
                        child: AppText(
                          title: tableRowsLit[index]['Day'].toString(),
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
