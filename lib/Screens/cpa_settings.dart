import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/WebHandler/DashboardController.dart';
import 'package:smokin_joes/WebHandler/Settings/cpa_settings_controller.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/Button.dart';
import 'package:smokin_joes/Widgets/CARD3.dart';

import '../HelperFunctions/HelperFunctions.dart';
import '../Widgets/AppDrawer.dart';
import '../Widgets/DropDown/store_drop_down.dart';
import '../Widgets/Tables/cpa_settings_table.dart';

class CpaSettings extends StatefulWidget {
  CpaSettings({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  State<CpaSettings> createState() => _ReportsState();
}

class _ReportsState extends State<CpaSettings> {
  String dropDownItemValue = 'Smoking Joe Tobacco Store Rockwood';
  final CpaSettingsController cpaSettingsController =
      Get.put(CpaSettingsController());
  final DashboardController dashboardController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    log('End of initstate');

    super.initState();
  }

  Future<void> fetchData() async {
    log('Start of method');
    await cpaSettingsController.getCpaSettings(
      id: dashboardController.storeList[0].data[0]['id'].toString(),
    );
    await cpaSettingsController.getActiveStatus(
        id: dashboardController.storeList[0].data[0]['id'].toString());

    await cpaSettingsController.getActiveStatus(
        id: dashboardController.storeList[0].data[0]['id'].toString());
    cpaSettingsController.isLoader.value = true;
    log('End of Method');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        key: widget._key,
        appBar: APPBAR(
          ontap: () {
            widget._key.currentState!.openDrawer();
          },
        ),
        drawer: const AppDrawer(),
        body: Obx(
          () => SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CARD3(
                    ImagePath: 'Images/Group 413.svg',
                    title: 'Cpa',
                    subTitle: 'Settings',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: StoreDropDown(
                            initialValue: cpaSettingsController
                                        .selectedStoreName.value !=
                                    ''
                                ? cpaSettingsController.selectedStoreName.value
                                : dashboardController.storeName[0].toString(),
                            width: 1.sw,
                            dropDownItems: dashboardController.storeName,
                            isAlternativeColor: true,
                            onChangeValue: (value) async {
                              cpaSettingsController.isLoader.value = false;
                              cpaSettingsController.cpaSettingsList.clear();

                              cpaSettingsController.selectedStoreName.value =
                                  value;
                              DashBoardFunction.findStoreId(value);
                              await cpaSettingsController.getActiveStatus(
                                  id: DashBoardFunction.id);
                              await cpaSettingsController.getActiveStatus(
                                  id: DashBoardFunction.id);
                              await cpaSettingsController.getCpaSettings(
                                  id: DashBoardFunction.id);

                              Future.delayed(const Duration(seconds: 1));
                              cpaSettingsController.isLoader.value = true;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        cpaSettingsController.cpaSettingsList.isEmpty ||
                                cpaSettingsController.isLoader.value == false
                            ? Container(
                                height: 33.h,
                                width: 0.30.sw,
                                decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              )
                            : AppButton(
                                width: 0.30.sw,
                                title: cpaSettingsController.activeStatus ==
                                        "Activated"
                                    ? 'Activated'
                                    : 'Deactivated',
                                voidCallback: () async {
                                  log('Initial value of the drop down: ${cpaSettingsController.selectedStoreName.value}');
                                  cpaSettingsController.isLoader.value = false;
                                  await DashBoardFunction.findStoreId(
                                      cpaSettingsController
                                          .selectedStoreName.value);
                                  log('Id of Selected value from button: ${DashBoardFunction.id}');
                                  await cpaSettingsController.getActiveStatus(
                                      id: DashBoardFunction.id);
                                  cpaSettingsController.cpaSettingsList.clear();

                                  await cpaSettingsController.getCpaSettings(
                                      id: DashBoardFunction.id);
                                  Future.delayed(const Duration(seconds: 1));
                                  cpaSettingsController.isLoader.value = true;
                                },
                                hight: 33.h,
                                color: cpaSettingsController.activeStatus ==
                                        "Activated"
                                    ? AppColors.tertiary
                                    : Colors.red,
                                //color: Colors.red,
                                fontSize: 12.sp),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: cpaSettingsController.cpaSettingsList.isEmpty ||
                            cpaSettingsController.isLoader.value == false
                        ? SizedBox(
                            width: 1.sw,
                            height: 400.h,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.tertiary,
                              ),
                            ),
                          )
                        : CpaSettingsTable(
                            tableRowsLit:
                                cpaSettingsController.cpaSettingsList[0].data,
                            firstHeading: 'Setting Name',
                            secondHeading: 'Status',
                            firstRowWidth: 5.sp,
                            firstHeaderWidth: 5.sp,
                          ),
                  ),
                  SizedBox(
                    height: 70.h,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
