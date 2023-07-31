import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/CARD3.dart';

import '../../Widgets/Button.dart';
import '../../Widgets/DropDown/custom_drop_down.dart';
import '../../Widgets/Tables/Reports/detailed_p&l_report_table.dart';
import '../../Widgets/custom_date_picker.dart';
import '../../Widgets/stack_design.dart';

class MoneyLeftOverReport extends StatefulWidget {
  const MoneyLeftOverReport({Key? key}) : super(key: key);

  @override
  State<MoneyLeftOverReport> createState() => _MoneyLeftOverReportState();
}

class _MoneyLeftOverReportState extends State<MoneyLeftOverReport> {
  int index = 0;
  DateTime selectedDate = DateTime.now();

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
              ImagePath: 'Images/Group 238.svg',
              title: 'Money Left Over',
              subTitle: 'Report',
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: AppText(
                      title: 'Store',
                      color: Colors.black,
                      size: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  CustomDropDown(
                    dropDownItems: filter.items,
                    width: 1.sw,
                    isSecondText: false,
                    isAlternativeColor: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: AppText(
                            title: 'From Month',
                            color: Colors.black,
                            size: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomDatePicker(
                          dateTime: '',
                          dateCallBack: (date) {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: AppText(
                            title: 'To Month',
                            color: Colors.black,
                            size: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomDatePicker(
                          dateTime: '',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  AppButton(
                    width: 80.w,
                    title: 'Search',
                    voidCallback: () {},
                    hight: 35.h,
                    fontSize: 14.sp,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: DetailedPLReportTable(
                month: DateFormat('dd/MMM/yyyy')
                    .format(
                      selectedDate,
                    )
                    .toString(),
                firstHeading: 'Head',
                secondHeading: 'Month',
                thirdHeading: 'Amount (\$)',
                tableRowsList: DetailedReportTableList.detailedReportTableList,
                secondHeaderWidth: 0.4,
                secondRowWidth: 0.4,
                thirdHeaderWidth: 0.4,
                thirdRowWidth: 0.4,
              ),
            ),
            SizedBox(height: 15.h),
            //total of first Table
            const StackDesign(text1: 'Total', text2: '18891.2'),
            //Checque Debit
            Padding(
              padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
              child: AppText(
                  title: 'Check Debit (-)',
                  color: AppColors.secondary,
                  size: 20.sp,
                  fontWeight: FontWeight.w500),
            ),

            //checque debit table
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: DetailedPLReportTable(
                month: DateFormat('dd/MMM/yyyy').format(
                  selectedDate,
                ),
                firstHeading: 'Head',
                secondHeading: 'Month',
                thirdHeading: 'Amount (\$)',
                tableRowsList:
                    DetailedReportTableList.detailedReportDebitTableList,
                secondHeaderWidth: 0.4,
                secondRowWidth: 0.4,
                thirdHeaderWidth: 0.4,
                thirdRowWidth: 0.4,
              ),
            ),
            SizedBox(height: 15.h),
            //total of cheque debit table Table
            const StackDesign(text1: 'Total', text2: '4517.41'),
            //Checque Credit table
            Padding(
              padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
              child: AppText(
                  title: 'Cheque Credit (+)',
                  color: AppColors.secondary,
                  size: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            //checque credit table
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: DetailedPLReportTable(
                month: DateFormat('dd/MMM/yyyy').format(
                  selectedDate,
                ),
                firstHeading: 'Head',
                secondHeading: 'Month',
                thirdHeading: 'Amount (\$)',
                tableRowsList:
                    DetailedReportTableList.detailedReportCreditTableList,
                secondHeaderWidth: 0.4,
                secondRowWidth: 0.4,
                thirdHeaderWidth: 0.4,
                thirdRowWidth: 0.4,
              ),
            ),
            SizedBox(height: 15.h),
            //total of cheque credit table Table
            const StackDesign(text1: 'Total', text2: '179872.16'),
            SizedBox(height: 15.h),
            //total P&L
            const StackDesign(text1: 'Total P&L', text2: '7769.45'),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}
