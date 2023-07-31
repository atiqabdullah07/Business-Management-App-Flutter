import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/WebHandler/Settings/dashboard_settings_controller.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/CARD3.dart';

import '../HelperFunctions/HelperFunctions.dart';
import '../WebHandler/DashboardController.dart';
import '../Widgets/AppDrawer.dart';
import '../Widgets/DropDown/store_drop_down.dart';
import '../Widgets/Tables/dashboard_settings_table.dart';

class Dashboard_Settings extends StatefulWidget {
  Dashboard_Settings({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  State<Dashboard_Settings> createState() => _ReportsState();
}

class _ReportsState extends State<Dashboard_Settings> {
  String dropDownItemValue = 'Smoking Joe Tobacco Store Rockwood';
  final DashboardSettingsController dashboardSettingsController =
      Get.put(DashboardSettingsController());
  final DashboardController dashboardController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    dashboardSettingsController.isLoader.value = false;

    dashboardSettingsController.getDashboardSettings(
      id: dashboardController.storeList[0].data[0]['id'].toString(),
    );

    dashboardSettingsController.isLoader.value = true;
    super.initState();
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
                    title: 'Dashboard',
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
                            initialValue: dashboardSettingsController
                                        .selectedStoreName.value !=
                                    ''
                                ? dashboardSettingsController
                                    .selectedStoreName.value
                                : dashboardController.storeName[0].toString(),
                            width: 1.sw,
                            dropDownItems: dashboardController.storeName,
                            isAlternativeColor: true,
                            onChangeValue: (value) async {
                              dashboardSettingsController.isLoader.value =
                                  false;
                              dashboardSettingsController
                                  .getDashboardSettingsList2
                                  .clear();
                              dashboardSettingsController
                                  .selectedStoreName.value = value;
                              DashBoardFunction.findStoreId(value);
                              dashboardSettingsController.getDashboardSettings(
                                  id: DashBoardFunction.id);

                              Future.delayed(const Duration(seconds: 1));
                              dashboardSettingsController.isLoader.value = true;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: dashboardSettingsController
                                .getDashboardSettingsList2.isEmpty ||
                            dashboardSettingsController.isLoader.value == false
                        ? SizedBox(
                            width: 1.sw,
                            height: 400.h,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.tertiary,
                              ),
                            ),
                          )
                        : DashboardSettingsTable(
                            tableRowsLit: dashboardSettingsController
                                .getDashboardSettingsList2,
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
