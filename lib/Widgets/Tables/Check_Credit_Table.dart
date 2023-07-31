import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/colors.dart';

class CheckCreditTableHeader extends StatelessWidget {
  const CheckCreditTableHeader({
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
            HeaderText('Amount'),
            SizedBox(
              width: 50.w,
            ),
            HeaderText('Check No'),
            SizedBox(
              width: 35.w,
            ),
            HeaderText('Vendor'),
            SizedBox(
              width: 25.w,
            ),
            HeaderText('File'),
            SizedBox(
              width: 22.w,
            ),
            HeaderText('Type'),
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

class CheckCreditListViewBuilder extends StatelessWidget {
  const CheckCreditListViewBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CheckCreditRow.amountList.length,
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
              children: [
                SizedBox(
                  width: 50.w,
                  //  color: Colors.red,
                  child: RowText(CheckCreditRow.amountList[index]),
                ),
                SizedBox(width: 50.w),
                SizedBox(
                  width: 60.w,
                  //    color: Colors.green,
                  child: RowText(CheckCreditRow.checkNoList[index]),
                ),
                SizedBox(width: 32.w),
                SizedBox(
                  width: 50.w,
                  //  color: Colors.red,
                  child: RowText(CheckCreditRow.vendorList[index]),
                ),
                SizedBox(width: 17.w),
                SizedBox(
                  width: 30.w,
                  //    color: Colors.yellow,
                  child: RowText(CheckCreditRow.fileList[index]),
                ),
                SizedBox(width: 18.w),
                SizedBox(
                  width: 40.w,
                  //  color: Colors.yellow,
                  child: RowText(CheckCreditRow.typeList[index]),
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

class CheckCreditRow {
  static var amountList = ['0.00'];
  static var checkNoList = ['5689'];
  static var vendorList = [''];
  static var fileList = [''];
  static var typeList = [''];
}
