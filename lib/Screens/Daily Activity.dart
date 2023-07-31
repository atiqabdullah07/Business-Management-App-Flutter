import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/WebHandler/daily_activity_controller/daily_activity_controller.dart';
import 'package:smokin_joes/Widgets/AlertDialogue/add_vendor_dialogue.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';

import '../Widgets/AppBar.dart';
import '../Widgets/Button.dart';
import '../Widgets/Card2.dart';
import '../Widgets/Tables/Check_Debit_Table.dart';
import '../Widgets/Tables/Daily_Activity_Table.dart';
import '../Widgets/stack_design.dart';

class Daily_Activity extends StatefulWidget {
  Daily_Activity({Key? key}) : super(key: key);

  @override
  State<Daily_Activity> createState() => _Daily_ActivityState();
}

class _Daily_ActivityState extends State<Daily_Activity> {
  String dropDownItemValue = 'Smoking Joe Tobacco Store Rockwood';
  static DateTime dateTime = DateTime.now();
  static DateFormat formatter = DateFormat('yyyy-MM-dd');
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final DailyActivityController dailyActivityController =
      Get.put(DailyActivityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      key: _key,
      appBar: APPBAR(
        ontap: () {
          _key.currentState!.openDrawer();
        },
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const CARD2(
                ImagePath: 'Images/Group 486.svg', title: 'Daily Activity'),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                        isExpanded: true,
                        dropdownWidth: 370.w,
                        buttonHeight: 35.h,
                        buttonWidth: 200.w,
                        dropdownMaxHeight: 0.5.sh,
                        scrollbarThickness: 0,
                        dropdownOverButton: false,
                        dropdownDecoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.r),
                          ),
                        ),
                        itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                        buttonDecoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        iconOnClick: const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: AppColors.secondary,
                        ),
                        style: GoogleFonts.manrope(
                          textStyle: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                        ),
                        itemHeight: 45.h,
                        value: dropDownItemValue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.secondary,
                        ),
                        items: filter.items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                // height: 27.h,
                                // width: 400.w,
                                decoration: BoxDecoration(
                                  color: filter.items.indexOf(items) % 2 == 0
                                      ? const Color(0xffF5F5F5)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        filter.items.indexOf(items) % 2 == 0
                                            ? 100
                                            : 0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      items,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.manrope(
                                        textStyle: TextStyle(
                                          color: AppColors.secondary,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            dropDownItemValue = newVal!;
                          });
                        }),
                  ),
                  SizedBox(
                    height: 35.h,
                    width: 120.w,
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primary),
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
                            const AssetImage(
                                'Images/Icons/icons8_calendar.png'),
                            color: AppColors.secondary,
                            size: 14.r,
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    onPressed: () {
                      dailyActivityController.getDailyActivity();
                    },
                    icon: ImageIcon(
                      const AssetImage('Images/Icons/icons8_print.png'),
                      color: AppColors.secondary,
                      size: 20.r,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            StackDesign(
                text1: 'Initial Balance',
                text2: dailyActivityController.initialBalance.toString()),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: DailyActivityTable(
                firstHeading: 'Head',
                secondHeading: 'Amount (\$)',
                thirdHeading: 'Month-Total (\$)',
                fourthHeading: 'Year-Total (\$',
                tableRowsLit: filter.activityTable,
                firstHeaderWidth: 1.2,
                firstRowWidth: 1.2,
                secondHeaderWidth: 0.8,
                secondRowWidth: 0.8,
              ),
            ),
            SizedBox(height: 20.h),
            StackDesign(
                text1: 'Ending Balance',
                text2: dailyActivityController.endingBalance),
            SizedBox(
              height: 5.h,
            ),
            const StackDesign(text1: 'Orignal Ending Balance', text2: '0.00'),
            Padding(
              padding: EdgeInsets.only(top: 70.h, bottom: 30.h),
              child: AppText(
                  title: 'Check Debit (-)',
                  color: AppColors.secondary,
                  size: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            const StackDesign(text1: 'Total', text2: '0.00'),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: SingleChildScrollView(
                child: CheckDebitTable(
                  firstHeading: 'Amount.',
                  secondHeading: 'Check No',
                  thirdHeading: 'Vendor',
                  fourthHeading: 'File',
                  fifthHeading: 'Type',
                  tableRowsLit: filter.checkDebitTable,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                    width: 130.w,
                    title: 'Add Check Debit',
                    voidCallback: () {
                      setState(() {
                        filter.checkDebitTable.add(
                          {
                            'AMOUNT': '0.00',
                            'CHECK_NO': '5689',
                            'VENDOR': '',
                            'FILE': '',
                            'TYPE': '',
                          },
                        );
                      });
                    },
                    hight: 35.h,
                    fontSize: 11.sp),
                SizedBox(
                  width: 20.w,
                ),
                AppButton(
                    width: 130.w,
                    title: 'Add Vendor',
                    voidCallback: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AddVendorDialogue();
                          });
                    },
                    hight: 35.h,
                    fontSize: 11.sp)
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 70.h, bottom: 30.h),
              child: AppText(
                  title: 'Check Credit (+)',
                  color: AppColors.secondary,
                  size: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            const StackDesign(text1: 'Total', text2: '0.00'),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: CheckDebitTable(
                firstHeading: 'Amount.',
                secondHeading: 'Check No',
                thirdHeading: 'Vendor',
                fourthHeading: 'File',
                fifthHeading: 'Type',
                tableRowsLit: filter.checkDebitTable,
                // firstHeaderWidth: 0.8,
                // firstRowWidth: 0.8,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                    width: 130.w,
                    title: 'Add Check Debit',
                    voidCallback: () {},
                    hight: 35.h,
                    fontSize: 11.sp),
                SizedBox(
                  width: 20.w,
                ),
                AppButton(
                    width: 130.w,
                    title: 'Add Vendor',
                    voidCallback: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AddVendorDialogue();
                          });
                    },
                    hight: 35.h,
                    fontSize: 11.sp)
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
              child: AppText(
                  title: 'Note',
                  color: AppColors.secondary,
                  size: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 14.w),
                  child: TextFormField(
                    autofocus: false,
                    style: GoogleFonts.manrope(
                        textStyle: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500)),
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write Here...',
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
