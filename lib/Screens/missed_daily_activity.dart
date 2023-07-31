import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/Button.dart';
import 'package:smokin_joes/Widgets/CARD3.dart';
import 'package:smokin_joes/Widgets/DropDown/custom_drop_down.dart';
import 'package:smokin_joes/Widgets/Tables/missed_daily_activity_table.dart';
import 'package:smokin_joes/Widgets/date_range_picker.dart';

class MissedDailyActivity extends StatelessWidget {
  MissedDailyActivity({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

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
                ImagePath: 'Images/Group 486.svg',
                title: 'Missed',
                subTitle: 'Daily Activity'),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Column(
                children: [
                  CustomDropDown(
                      width: 1.sw,
                      dropDownItems: filter.items,
                      isAlternativeColor: true),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(child: CustomDateRangePicker(width: 250.w)),
                      SizedBox(
                        width: 20.w,
                      ),
                      AppButton(
                          width: 100.w,
                          title: 'Search',
                          voidCallback: () {},
                          hight: 35.h,
                          fontSize: 12.sp)
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MissedDailyAvtivityDataTable(
                    tableRowsLit: filter.missedDailyActivityList,
                    firstHeading: 'Date',
                    secondHeading: 'Month',
                    thirdHeading: 'Day',
                    thirdRowWidth: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
