import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/Constants/image_constant.dart';

class BankStatementTable extends StatelessWidget {
  const BankStatementTable({
    Key? key,
    required this.tableRowsLit,
    required this.firstHeading,
    required this.secondHeading,
    required this.thirdHeading,
    required this.fourthHeading,
    required this.fifthHeading,
    this.firstHeaderWidth,
    this.secondHeaderWidth,
    this.thirdHeaderWidth,
    this.fourthHeaderWidth,
    this.fifthHeaderWidth,
    this.firstRowWidth,
    this.secondRowWidth,
    this.thirdRowWidth,
    this.fourthRowWidth,
    this.fifthRowWidth,
  }) : super(key: key);

  final List tableRowsLit;
  final String firstHeading;
  final String secondHeading;
  final String thirdHeading;
  final String fourthHeading;
  final String fifthHeading;

  //header width
  final double? firstHeaderWidth;
  final double? secondHeaderWidth;
  final double? thirdHeaderWidth;
  final double? fourthHeaderWidth;
  final double? fifthHeaderWidth;

  //rows widht
  final double? firstRowWidth;
  final double? secondRowWidth;
  final double? thirdRowWidth;
  final double? fourthRowWidth;
  final double? fifthRowWidth;

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
                    child: AppText(
                      title: firstHeading,
                      color: Colors.white,
                      size: 10,
                      fontWeight: FontWeight.w500,
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
                    child: AppText(
                      title: secondHeading,
                      color: Colors.white,
                      size: 10,
                      fontWeight: FontWeight.w500,
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
                    child: AppText(
                      title: thirdHeading,
                      color: Colors.white,
                      size: 10,
                      fontWeight: FontWeight.w500,
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
                    child: AppText(
                      title: fourthHeading,
                      color: Colors.white,
                      size: 10,
                      fontWeight: FontWeight.w500,
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
                    child: AppText(
                      title: fifthHeading,
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
                        child: AppText(
                          title: tableRowsLit[index]['ID'].toString(),
                          color: AppColors.secondary,
                          size: 8,
                          fontWeight: FontWeight.w500,
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
                        child: AppText(
                          title: tableRowsLit[index]['TITLE'].toString(),
                          color: AppColors.secondary,
                          size: 8,
                          fontWeight: FontWeight.w500,
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
                        child: AppText(
                          title: tableRowsLit[index]['NUMBER'].toString(),
                          color: AppColors.secondary,
                          size: 8,
                          fontWeight: FontWeight.w500,
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
                        child: AppText(
                          title: '${tableRowsLit[index]['MONTH']}',
                          color: AppColors.secondary,
                          size: 8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Material(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10.h,
                              bottom: 10.h,
                              right: 20.w,
                              left: 3.w,
                            ),
                            child: SizedBox(
                              height: 20.r,
                              width: 20.r,
                              child: SvgPicture.asset(
                                alignment: Alignment.centerLeft,
                                ImageConstant.viewDocument,
                                height: 20.r,
                                width: 20.r,
                              ),
                            ),
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
