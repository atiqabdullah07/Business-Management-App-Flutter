import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/Button.dart';
import 'package:smokin_joes/Widgets/CARD3.dart';
import 'package:smokin_joes/Widgets/DropDown/custom_drop_down.dart';
import 'package:smokin_joes/Widgets/Tables/lottery_table.dart';
import 'package:smokin_joes/Widgets/stack_design.dart';

import '../Constants/AppText.dart';
import '../Constants/colors.dart';

class DailyLotterySold extends StatelessWidget {
  DailyLotterySold({Key? key}) : super(key: key);
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
                  ImagePath: 'Images/Group 630.svg',
                  title: 'Daily',
                  subTitle: 'Lottery Sold'),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                child: CustomDropDown(
                    width: 1.sw,
                    dropDownItems: filter.items,
                    isAlternativeColor: false),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  children: [
                    const Expanded(
                      child: DatePicker(),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    CustomDropDown(
                        width: 140.w,
                        dropDownItems: filter.timeOFDay,
                        isAlternativeColor: false),
                    SizedBox(
                      width: 8.w,
                    ),
                    AppButton(
                        width: 80.w,
                        title: 'Print',
                        voidCallback: () {},
                        hight: 35.h,
                        fontSize: 12.sp)
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 1.5.sw,
                    height: 500.h,
                    child: LotteryDataTable(
                      tableRowsLit: filter.lotterySoldTable,
                      firstHeading: 'Game',
                      secondHeading: 'Value(\$)',
                      thirdHeading: 'Ticket',
                      fourthHeading: 'Start',
                      fifthHeading: 'End',
                      sixthHeading: 'Rolls',
                      seventhHeading: 'Total(\$)',
                      firstHeaderWidth: 0.7,
                      firstRowWidth: 0.7,
                    ),
                  ),
                ),
              ),
              const StackDesign(text1: 'Total(\$)', text2: '0'),
              SizedBox(
                height: 70.h,
              ),
            ],
          ),
        ));
  }
}

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key, this.width}) : super(key: key);
  final double? width;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  static DateTime dateTime = DateTime.now();
  static DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: widget.width,
      child: ElevatedButton(
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2001),
            lastDate: DateTime(2222),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.tertiary, // <-- SEE HERE
                  ),
                ),
                child: child!,
              );
            },
          ).then((date) {
            setState(() {
              dateTime = date!;
            });
          });
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
                title: formatter.format(dateTime).toString(),
                color: AppColors.secondary,
                size: 10.sp,
                fontWeight: FontWeight.w500),
            ImageIcon(
              const AssetImage('Images/Icons/icons8_calendar.png'),
              color: AppColors.secondary,
              size: 14.r,
            ),
          ],
        ),
      ),
    );
  }
}
