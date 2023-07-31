import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/DropDown/custom_drop_down.dart';
import 'package:smokin_joes/Widgets/custom_date_picker.dart';
import 'package:smokin_joes/Widgets/stack_design.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Constants/BarChartModel.dart';
import '../../Constants/chart_data.dart';
import '../../Constants/colors.dart';
import '../../Widgets/AppDrawer.dart';
import '../../Widgets/CARD3.dart';

class ReportVisuals extends StatelessWidget {
  ReportVisuals({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final LinearGradient linearGradient = const LinearGradient(
    colors: <Color>[Color(0xff192C62), Color(0xffE11941)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CARD3(
                ImagePath: 'Images/Group 679.svg',
                title: 'Reports',
                subTitle: 'Visuals'),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                children: [
                  Expanded(
                    child: CustomDropDown(
                        width: 200.w,
                        dropDownItems: filter.items,
                        isAlternativeColor: false),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomDatePicker(
                    dateTime: '',
                    width: 140.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            const StackDesign(text1: 'Total Business', text2: '\$176762.51'),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 170.h,
              width: 370.w,
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  majorTickLines: const MajorTickLines(width: 0),
                  labelStyle:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  axisLine: const AxisLine(color: AppColors.background),
                ),
                primaryYAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(width: 1),
                  majorTickLines: const MajorTickLines(width: 0),
                  maximum: 2500,
                  minimum: 0,
                  interval: 500,
                  axisLine: const AxisLine(color: AppColors.background),
                  labelStyle:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                ),
                series: <ChartSeries>[
                  ColumnSeries<BarChartModel, String>(
                      dataSource: ChartsData.reportsChartData1,
                      width: 0.3.w,
                      isTrackVisible: true,
                      trackColor: const Color(0xffE5E5E5),
                      trackBorderWidth: 0.3.w,
                      color: Colors.purple,
                      gradient: linearGradient,
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      xValueMapper: (BarChartModel profit, _) => profit.month,
                      yValueMapper: (BarChartModel profit, _) => profit.profit),
                ],
              ),
              //     ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const StackDesign(
                text1: 'Total Inentory Purchased', text2: '\$12434734.34'),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 170.h,
              width: 370.w,
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  majorTickLines: const MajorTickLines(width: 0),
                  labelStyle:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  axisLine: const AxisLine(color: AppColors.background),
                ),
                primaryYAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(width: 1),
                  majorTickLines: const MajorTickLines(width: 0),
                  maximum: 2500,
                  minimum: 0,
                  interval: 500,
                  axisLine: const AxisLine(color: AppColors.background),
                  labelStyle:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                ),
                series: <ChartSeries>[
                  ColumnSeries<BarChartModel, String>(
                      dataSource: ChartsData.reportsChartData1,
                      width: 0.3.w,
                      isTrackVisible: true,
                      trackColor: const Color(0xffE5E5E5),
                      trackBorderWidth: 0.3.w,
                      color: Colors.purple,
                      gradient: linearGradient,
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      xValueMapper: (BarChartModel profit, _) => profit.month,
                      yValueMapper: (BarChartModel profit, _) => profit.profit),
                ],
              ),
              //     ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const StackDesign(text1: 'Total Money Left', text2: '\$675734.34'),
            SizedBox(
              height: 80.h,
            ),
          ],
        ),
      ),
    );
  }
}
