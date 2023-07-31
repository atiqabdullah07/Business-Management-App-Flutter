import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Constants/chart_data.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/WebHandler/DashboardController.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/DropDown/static_drop_down.dart';
import 'package:smokin_joes/Widgets/DropDown/store_drop_down.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Constants/BarChartModel.dart';
import '../HelperFunctions/HelperFunctions.dart';
import '../Widgets/Button.dart';
import '../Widgets/Card.dart';
import '../Widgets/Data_Table.dart';
import '../Widgets/Gradient_Icon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DashboardController controller = Get.find();

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  String monthDropDownValue = 'January';
  String yaerDropDownValue = '2020';
  String dropDownValue = 'Monthly';
  String dropDownItemValue = 'Smoking Joe Tobacco Store Rockwood';
  String vendorItemValue = 'Total Businesses';
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    getDepartmentStore();
    super.initState();
  }

  Future<void> getDepartmentStore() async {
    log('\n\n\n\n\n\n\n\n\n\nhome init state\n\n\n\n\n\n\n');
    Future.delayed(const Duration(seconds: 5), () async {
      print('One second has passed.'); // Prints after 1 second.
      await controller.fetchStore();
    });
  }

  final LinearGradient linearGradient = const LinearGradient(
    colors: <Color>[Color(0xff192C62), Color(0xffE11941)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: AppColors.background,
      appBar: APPBAR(
        ontap: () {
          _key.currentState!.openDrawer();
        },
      ),
      drawer: const AppDrawer(),
      body: WillPopScope(
        onWillPop: () async {
          Dialogs.bottomMaterialDialog(
            msg: 'Are you sure you want to exit the app?',
            title: 'Exit App',
            context: context,
            actions: [
              IconsOutlineButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  return false;
                },
                text: 'Cancel',
                iconData: Icons.cancel_outlined,
                textStyle: const TextStyle(color: Colors.grey),
                iconColor: Colors.grey,
              ),
              IconsButton(
                onPressed: () {
                  SystemNavigator.pop();
                  return true;
                },
                text: 'Yes',
                iconData: Icons.exit_to_app,
                color: Colors.red,
                textStyle: const TextStyle(color: Colors.white),
                iconColor: Colors.white,
              ),
            ],
          );

          return false;
        },
        child: Obx(
          () => controller.storeList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 21.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: StoreDropDown(
                          initialValue: controller.selectedStoreName.value != ''
                              ? controller.selectedStoreName.value
                              : controller.storeName[0].toString(),
                          width: 1.sw,
                          dropDownItems: controller
                              .storeName, //controller.storeList[0].data,
                          isAlternativeColor: true,
                          onChangeValue: (value) {
                            // controller.selectedStore.clear();
                            DashBoardFunction.findStoreId(value);
                            log('value from selected store dropdown: $value');
                          },
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: StaticDropDown(
                                initialValue:
                                    controller.isMonthlyOrYearlyData.value,
                                width: 0,
                                dropDownItems: const ['Monthly', 'Yearly'],
                                isAlternativeColor: false,
                                onChangeValue: (value) {
                                  if (value == 'Monthly') {
                                    controller.isMonthOrYear.value =
                                        filter.monthItems[0];
                                  } else {
                                    filter.yearItems[0];
                                  }
                                  controller.isMonthlyOrYearlyData.value =
                                      value;
                                  log('value from month dropdown: $value');
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Obx(
                              () => Expanded(
                                child: StaticDropDown(
                                  initialValue: controller.isMonthOrYear.value,
                                  width: 0,
                                  dropDownItems:
                                      controller.isMonthlyOrYearlyData.value ==
                                              'Monthly'
                                          ? filter.monthItems
                                          : filter.yearItems,
                                  isAlternativeColor: false,
                                  onChangeValue: (value) {},
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            AppButton(
                              width: 77.w,
                              hight: 33.h,
                              fontSize: 11,
                              title: 'Search',
                              voidCallback: () {
                                if (controller.selectedStore.isEmpty) {
                                  controller
                                      .getDashboardDetailsByMonthlyOrYearlyBasis(
                                    qryType: '2',
                                    type:
                                        controller.isMonthlyOrYearlyData.value,
                                    department: controller.selectedStore[0]
                                        ['id'],
                                    month: controller
                                                .isMonthlyOrYearlyData.value ==
                                            'Monthly'
                                        ? controller.isMonthOrYear.value
                                        : null,
                                    year: controller
                                                .isMonthlyOrYearlyData.value ==
                                            'Monthly'
                                        ? controller.isMonthOrYear.value
                                        : null,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      const CARD(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child:
                            // MappingSettingDropDown(
                            //   width: 1.sw,
                            //   dropDownItems: controller.mappingSettingList[0]
                            //       ['vendor_types'],
                            //   isAlternativeColor: true,
                            // ),

                            DropdownButtonHideUnderline(
                          child: DropdownButton2(
                              isExpanded: true,
                              buttonHeight: 35.h,
                              buttonWidth: 1.sw,
                              dropdownMaxHeight: 400.h,
                              scrollbarThickness: 0,
                              iconOnClick: const Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: AppColors.secondary,
                              ),
                              buttonPadding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  top: 5.h,
                                  bottom: 5.h),
                              buttonDecoration: BoxDecoration(
                                color: AppColors.background,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: -10,
                                    blurRadius: 15,
                                  ),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.r),
                                ),
                              ),
                              dropdownDecoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 11.sp,
                              ),
                              value: vendorItemValue,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.secondary,
                              ),
                              items: filter.vendorItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          GradientIcon(
                                            iconSize: 20.r,
                                            iconData:
                                                Icons.monetization_on_rounded,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Container(
                                            child: AppText(
                                                title: items,
                                                color: AppColors.secondary,
                                                size: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Container(
                                        child: AppText(
                                            title: '\$22543',
                                            color: AppColors.secondary,
                                            size: 11.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  vendorItemValue = newValue!;
                                });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                              title: 'Utility',
                              size: 16.sp,
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            width: 10.w,
                          ),
                          AppText(
                              title: '\$8201.75',
                              color: AppColors.secondary,
                              size: 16.sp,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: CustomDataTable(
                          firstHeading: 'No.',
                          secondHeading: 'Title',
                          thirdHeading: 'Date/Month',
                          fourthHeading: 'Amount (\$)',
                          tableRowsLit: filter.utilityTable,
                          firstHeaderWidth: 0.8,
                          firstRowWidth: 0.8,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        height: 170.h,
                        width: 370.w,
                        child: SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          primaryXAxis: CategoryAxis(
                            majorGridLines: const MajorGridLines(width: 0),
                            majorTickLines: const MajorTickLines(width: 0),
                            labelStyle: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w500),
                            axisLine:
                                const AxisLine(color: AppColors.background),
                          ),
                          primaryYAxis: NumericAxis(
                            majorGridLines: const MajorGridLines(width: 1),
                            majorTickLines: const MajorTickLines(width: 0),
                            maximum: 2500,
                            minimum: 0,
                            interval: 500,
                            axisLine:
                                const AxisLine(color: AppColors.background),
                            labelStyle: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w500),
                          ),
                          series: <ChartSeries>[
                            ColumnSeries<BarChartModel, String>(
                                dataSource: ChartsData.homeChartData,
                                width: 0.3.w,
                                isTrackVisible: true,
                                trackColor: const Color(0xffE5E5E5),
                                trackBorderWidth: 0.3.w,
                                color: Colors.purple,
                                gradient: linearGradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                                xValueMapper: (BarChartModel profit, _) =>
                                    profit.month,
                                yValueMapper: (BarChartModel profit, _) =>
                                    profit.profit),
                          ],
                        ),
                        //     ),
                      ),
                      SizedBox(
                        height: 70.h,
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
