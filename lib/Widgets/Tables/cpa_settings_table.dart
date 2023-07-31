import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/WebHandler/Settings/cpa_settings_controller.dart';
import 'package:smokin_joes/Widgets/switch_button.dart';

import '../../Constants/colors.dart';
import '../../HelperFunctions/HelperFunctions.dart';

class CpaSettingsTable extends StatelessWidget {
  final CpaSettingsController cpaSettingsController = Get.find();

  CpaSettingsTable({
    Key? key,
    required this.tableRowsLit,
    required this.firstHeading,
    required this.secondHeading,
    this.firstHeaderWidth,
    this.secondHeaderWidth,
    this.firstRowWidth,
    this.secondRowWidth,
  }) : super(key: key);

  final List tableRowsLit;
  final String firstHeading;
  final String secondHeading;

  //header width
  final double? firstHeaderWidth;
  final double? secondHeaderWidth;

  //rows widht
  final double? firstRowWidth;
  final double? secondRowWidth;

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
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.tertiary),
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
                          top: 20.h,
                          bottom: 20.h,
                        ),
                        child: AppText(
                          title: tableRowsLit[index].settingName.toString(),
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
                          left: 3.w,
                          right: 3.w,
                        ),
                        child: SizedBox(
                          height: 33.h,
                          child: SwitchButton(
                            switchStatus: tableRowsLit[index].status.toString(),
                            onPress: () async {
                              cpaSettingsController.isLoader.value = false;
                              DashBoardFunction.findStoreId(
                                  cpaSettingsController
                                      .selectedStoreName.value);

                              await cpaSettingsController.changeSettings(
                                departmentID: DashBoardFunction.id.toString(),
                                settingsID:
                                    tableRowsLit[index].settingId.toString(),
                              );
                              cpaSettingsController.cpaSettingsList.clear();
                              Future.delayed(const Duration(seconds: 2));

                              await cpaSettingsController.getCpaSettings(
                                  id: DashBoardFunction.id.toString());

                              cpaSettingsController.isLoader.value = true;
                            },
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
