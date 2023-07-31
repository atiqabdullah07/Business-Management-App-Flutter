import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smokin_joes/Constants/AppText.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/CARD3.dart';

import '../../Widgets/Button.dart';
import '../../Widgets/Tables/Reports_Table.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  String dropDownItemValue = 'Smoking Joe Tobacco Store Rockwood';
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  String vendorDropDownValue = 'Accounting Fee';
  String paymentTypeDropDownValue = 'Cheque';
  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            SizedBox(
              height: 650.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CARD3(
                        ImagePath: 'Images/Group 238.svg',
                        title: 'Vendor Check',
                        subTitle: 'Data Report'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w, right: 14.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 130.h,
                              width: 175.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  titleText('     Store'),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                        isExpanded: true,
                                        dropdownWidth: 370.w,
                                        buttonHeight: 35.h,
                                        dropdownMaxHeight: 0.5.sh,
                                        scrollbarThickness: 0,
                                        dropdownOverButton: false,
                                        dropdownDecoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25.r),
                                          ),
                                        ),
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 8),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 0),
                                                // height: 27.h,
                                                // width: 400.w,
                                                decoration: BoxDecoration(
                                                  color: filter.items.indexOf(
                                                                  items) %
                                                              2 ==
                                                          0
                                                      ? const Color(0xffF5F5F5)
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(filter.items
                                                                    .indexOf(
                                                                        items) %
                                                                2 ==
                                                            0
                                                        ? 100
                                                        : 0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 5.w),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      items,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.manrope(
                                                        textStyle: TextStyle(
                                                            color: AppColors
                                                                .secondary,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 10.sp),
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
                                    height: 20.h,
                                  ),
                                  titleText('     Vendor'),
                                  Container(
                                    height: 35.h,
                                    // width: 170.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: TextField(
                                        style: GoogleFonts.manrope(
                                          textStyle: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 0,
                                            horizontal: 10,
                                          ),
                                          border: InputBorder.none,
                                          hintText: 'Search Here',
                                          hintStyle: GoogleFonts.manrope(
                                            textStyle: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 130.h,
                            width: 175.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                titleText('Date'),
                                GestureDetector(
                                  onTap: () {
                                    showDateRangePicker(
                                      context: context,
                                      firstDate: DateTime(2001),
                                      lastDate: DateTime(2222),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              primary: AppColors.tertiary,
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    ).then((date) {
                                      setState(() {
                                        dateTimeRange = date!;
                                      });
                                    });
                                  },
                                  child: Container(
                                    height: 35.h,
                                    width: 170.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppText(
                                            title:
                                                '${dateTimeRange.start.toString().split(' ')[0]} - ${dateTimeRange.end.toString().split(' ')[0]}',
                                            color: AppColors.secondary,
                                            size: 10.sp,
                                            fontWeight: FontWeight.w500)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                titleText('Vendor Type'),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                      buttonHeight: 35.h,
                                      buttonWidth: 170.w,
                                      buttonDecoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50.r),
                                        ),
                                      ),
                                      dropdownDecoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(17.r),
                                        ),
                                      ),
                                      buttonPadding: EdgeInsets.only(
                                          left: 8.w, right: 5.w),
                                      style: GoogleFonts.manrope(
                                        textStyle: TextStyle(
                                          color: AppColors.secondary,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                      iconOnClick: const Icon(
                                        Icons.keyboard_arrow_up_outlined,
                                        color: AppColors.secondary,
                                      ),
                                      itemHeight: 35.h,
                                      value: vendorDropDownValue,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.secondary,
                                      ),
                                      items: filter.vendorType
                                          .map((String vendorItems) {
                                        return DropdownMenuItem(
                                          value: vendorItems,
                                          child: AppText(
                                              title: vendorItems,
                                              color: AppColors.secondary,
                                              size: 11.sp,
                                              fontWeight: FontWeight.w500),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          vendorDropDownValue = newValue!;
                                        });
                                      }),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w, right: 14.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleText('Type'),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                    buttonHeight: 35.h,
                                    buttonWidth: 120.w,
                                    buttonDecoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.r),
                                      ),
                                    ),
                                    dropdownDecoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(17.r),
                                      ),
                                    ),
                                    buttonPadding:
                                        EdgeInsets.only(left: 8.w, right: 5.w),
                                    style: GoogleFonts.manrope(
                                      textStyle: TextStyle(
                                        color: AppColors.secondary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                    iconOnClick: const Icon(
                                      Icons.keyboard_arrow_up_outlined,
                                      color: AppColors.secondary,
                                    ),
                                    itemHeight: 35.h,
                                    value: paymentTypeDropDownValue,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.secondary,
                                    ),
                                    items: filter.paymentType
                                        .map((String vendorItems) {
                                      return DropdownMenuItem(
                                          value: vendorItems,
                                          child: AppText(
                                              title: vendorItems,
                                              color: AppColors.secondary,
                                              size: 11.sp,
                                              fontWeight: FontWeight.w500));
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        paymentTypeDropDownValue = newValue!;
                                      });
                                    }),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleText('Check No'),
                              customTextField('Enter Cheque No', 150.w)
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              titleText(''),
                              AppButton(
                                width: 77.w,
                                hight: 33.h,
                                fontSize: 11,
                                title: 'Search',
                                voidCallback: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppText(
                        title: 'Reports(s)',
                        color: AppColors.secondary,
                        size: 20.sp,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w, right: 14.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customTextField('Search Here', 150.w),
                          const SizedBox(
                            width: 4,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                                buttonHeight: 35.h,
                                buttonWidth: 120.w,
                                buttonDecoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.r),
                                  ),
                                ),
                                dropdownDecoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(17.r),
                                  ),
                                ),
                                buttonPadding:
                                    EdgeInsets.only(left: 8.w, right: 5.w),
                                style: GoogleFonts.manrope(
                                  textStyle: TextStyle(
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                iconOnClick: const Icon(
                                  Icons.keyboard_arrow_up_outlined,
                                  color: AppColors.secondary,
                                ),
                                itemHeight: 35.h,
                                value: paymentTypeDropDownValue,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.secondary,
                                ),
                                items: filter.paymentType
                                    .map((String vendorItems) {
                                  return DropdownMenuItem(
                                      value: vendorItems,
                                      child: AppText(
                                          title: vendorItems,
                                          color: AppColors.secondary,
                                          size: 11.sp,
                                          fontWeight: FontWeight.w500));
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    paymentTypeDropDownValue = newValue!;
                                  });
                                }),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          screenIcon('Images/Icons/icons8_copy.png'),
                          const SizedBox(
                            width: 4,
                          ),
                          screenIcon('Images/Icons/icons8_export_csv.png'),
                          const SizedBox(
                            width: 4,
                          ),
                          screenIcon('Images/Icons/icons8_print.png'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w, right: 14.w),
                      child: SizedBox(
                        height: 240.h,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            const ReportsTableHeader(),
                            SingleChildScrollView(
                              child: SizedBox(
                                height: 200.h,
                                child: const ReportsListViewBuilder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 125.h,
              width: 410.w,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, -20),
                    spreadRadius: -22,
                    blurRadius: 20,
                  )
                ],
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  children: [
                    AppText(
                        title:
                            "Total Credits: 477432.1   |    Total Debit: 488523.42",
                        color: AppColors.secondary,
                        size: 10.sp,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //////////////////////////////////Methods////////////////////////////////////////////////////

  Widget screenIcon(String imagePath) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ImageIcon(
            AssetImage(imagePath),
            color: AppColors.tertiary,
            size: 21.r,
          ),
        ),
      ),
    );
  }

  Container customTextField(String hintText, double width) {
    return Container(
      height: 35.h,
      width: width,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: Center(
        child: TextField(
          style: GoogleFonts.manrope(
            textStyle: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.secondary),
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 11.sp,
            ),
          ),
        ),
      ),
    );
  }

  Text titleText(String title) {
    return Text(
      title,
      style: GoogleFonts.manrope(
          textStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500)),
    );
  }
}
