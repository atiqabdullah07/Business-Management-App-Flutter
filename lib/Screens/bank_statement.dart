import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/Widgets/AlertDialogue/add_bank_Statement_dialogue.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/Button.dart';
import 'package:smokin_joes/Widgets/Card2.dart';
import 'package:smokin_joes/Widgets/DropDown/custom_drop_down.dart';
import 'package:smokin_joes/Widgets/Tables/bank_statement_table.dart';
import 'package:smokin_joes/Widgets/custom_date_picker.dart';

class BankStatement extends StatelessWidget {
  BankStatement({Key? key}) : super(key: key);

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
            const CARD2(
              ImagePath: "Images/Group 338.svg",
              title: 'Bank Statement',
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                children: [
                  Expanded(
                    child: CustomDropDown(
                      width: 230,
                      dropDownItems: filter.vendorItems,
                      isAlternativeColor: true,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  CustomDatePicker(
                    dateTime: '',
                    width: 150.w,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 35.h,
                      width: 170.w,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Center(
                          child: TextField(
                            style: TextStyle(fontSize: 11.sp),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 10,
                              ),
                              border: InputBorder.none,
                              hintText: 'Search Here',
                              hintStyle: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  AppButton(
                    width: 150.w,
                    title: 'Add Bank Statement',
                    voidCallback: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AddBankStatementDialogue(
                              cancelCallBack: () {},
                              saveCallBack: () {},
                            );
                          });
                    },
                    hight: 35.h,
                    fontSize: 13.sp,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: BankStatementTable(
                firstHeading: '#',
                secondHeading: 'Title',
                thirdHeading: 'Number',
                fourthHeading: 'Month',
                fifthHeading: 'View',
                tableRowsLit: BankStatementTableList.bankStatementList,
                firstHeaderWidth: 0.4,
                firstRowWidth: 0.4,
                fifthHeaderWidth: 0.6,
                fifthRowWidth: 0.6,
              ),
            ),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}
