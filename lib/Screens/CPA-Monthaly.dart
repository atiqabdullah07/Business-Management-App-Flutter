import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Widgets/AlertDialogue/send_email_dialogue.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/Button.dart';
import 'package:smokin_joes/Widgets/Card2.dart';
import 'package:smokin_joes/Widgets/Tables/cpa_monthly_table.dart';
import 'package:smokin_joes/Widgets/date_range_picker.dart';

import '../Constants/lists.dart';
import '../Widgets/AppDrawer.dart';

class CpaMonthly extends StatefulWidget {
  const CpaMonthly({Key? key}) : super(key: key);

  @override
  State<CpaMonthly> createState() => _CpaMonthlyState();
}

class _CpaMonthlyState extends State<CpaMonthly> {
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
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CARD2(
              ImagePath: "Images/Group 338.svg",
              title: 'CPA-Monthly',
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                children: [
                  CustomDateRangePicker(
                    width: 170.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  AppButton(
                      width: 95.w,
                      hight: 35.h,
                      fontSize: 10,
                      title: 'pdf Export',
                      voidCallback: () {}),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: AppButton(
                        width: 113.w,
                        hight: 35.h,
                        fontSize: 10,
                        title: 'Send to Email',
                        voidCallback: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const SendEmailDialogue();
                              });
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                    width: 1.5.sw,
                    height: 0.48.sh,
                    child: CpaMonthlyDataTable(
                        tableRowsLit: DataTableList.list,
                        firstHeading: 'Business',
                        secondHeading: 'Corporation',
                        thirdHeading: 'Date',
                        fourthHeading: 'Business',
                        fifthHeading: 'Tax',
                        sixthHeading: 'Gas',
                        seventhHeading: 'Gallons')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
