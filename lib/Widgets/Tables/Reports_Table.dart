import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/colors.dart';

class ReportsTableHeader extends StatelessWidget {
  const ReportsTableHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        color: AppColors.tertiary,
        borderRadius: BorderRadius.all(
          Radius.circular(50.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderText('Date'),
            SizedBox(
              width: 50.w,
            ),
            HeaderText('Type'),
            SizedBox(
              width: 25.w,
            ),
            HeaderText('Cheque No'),
            SizedBox(
              width: 20.w,
            ),
            HeaderText('Amounts(\$)'),
            SizedBox(
              width: 10.w,
            ),
            HeaderText('Vendor'),
          ],
        ),
      ),
    );
  }

  Widget HeaderText(String text) {
    return AppText(
        title: text,
        color: Colors.white,
        size: 10.sp,
        fontWeight: FontWeight.w500);
  }
}

class ReportsListViewBuilder extends StatelessWidget {
  const ReportsListViewBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: ReportsTableRow.dateList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 35.h,
          decoration: BoxDecoration(
            color: index % 2 == 0 ? AppColors.primary : AppColors.background,
            borderRadius: BorderRadius.all(
              Radius.circular(50.r),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70.w,
                  //   color: Colors.teal,
                  child: RowText(ReportsTableRow.dateList[index]),
                ),
                SizedBox(width: 12.w),
                Container(
                  width: 40.w,
                  //    color: Colors.green,
                  child: RowText(ReportsTableRow.typeList[index]),
                ),
                SizedBox(width: 12.w),
                Container(
                  width: 60.w,
                  //   color: Colors.red,
                  child: RowText(ReportsTableRow.chequeNoList[index]),
                ),
                SizedBox(width: 25.w),
                Container(
                  width: 70.w,
                  //   color: Colors.yellow,
                  child: RowText(ReportsTableRow.amountList[index]),
                ),
                SizedBox(width: 13.w),
                Container(
                  width: 47.w,
                  // color: Colors.yellow,
                  child: RowText(ReportsTableRow.vendorList[index]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget RowText(String text) {
    return AppText(
        title: text,
        color: AppColors.secondary,
        size: 8.sp,
        fontWeight: FontWeight.w500);
  }
}

class ReportsTableRow {
  static var dateList = [
    '01-Feb-2021',
    '01-Feb-2021',
    '01-Feb-2021',
    '01-Feb-2021',
    '01-Feb-2021',
    '01-Feb-2021',
    '01-Feb-2021',
    '01-Feb-2021',
    '01-Feb-2021',
    '01-Feb-2021',
    '01-Feb-2021',
    '01-Feb-2021',
  ];
  static var typeList = [
    'Debit',
    'Debit',
    'Debit',
    'Debit',
    'Debit',
    'Debit',
    'Debit',
    'Debit',
    'Debit',
    'Debit',
    'Debit',
    'Debit',
  ];
  static var chequeNoList = [
    '5897',
    '5897',
    '5897',
    '5897',
    '5897',
    '5897',
    '5897',
    '5897',
    '5897',
    '5897',
    '5897',
    '5897',
  ];
  static var amountList = [
    '99.78',
    '99.78',
    '99.78',
    '99.78',
    '99.78',
    '99.78',
    '99.78',
    '99.78',
    '99.78',
    '99.78',
    '99.78',
    '99.78',
  ];
  static var vendorList = [
    'Daniel',
    'Coca Cola',
    'Mayfield Milk',
    'BDT Beverage',
    'Cash Deposit',
    'Daniel',
    'Coca Cola',
    'Mayfield Milk',
    'BDT Beverage',
    'Cash Deposit',
    'Daniel',
    'Coca Cola',
  ];
}
