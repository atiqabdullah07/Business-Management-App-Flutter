import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/Screens/view_invoices_screen.dart';
import 'package:smokin_joes/WebHandler/invoice_controller.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/Card2.dart';

import '../Widgets/Button.dart';
import '../Widgets/Tables/invoice_table.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final InvoiceController invoiceController = Get.find();
  int index = 0;

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
        body: Obx(
          () => invoiceController.getInvoiceList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const CARD2(
                        ImagePath: "Images/Group 338.svg",
                        title: 'Invoices',
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 35.h,
                                // width: 170.w,
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
                                        contentPadding:
                                            const EdgeInsets.symmetric(
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
                            SizedBox(
                              width: 15.w,
                            ),
                            AppButton(
                                width: 95.w,
                                hight: 35.h,
                                fontSize: 10,
                                title: 'Pdf Export',
                                voidCallback: () {}),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14.w, right: 14.w),
                        child: InvoiceTable(
                          firstHeading: '#',
                          secondHeading: 'Name',
                          thirdHeading: 'Category',
                          fourthHeading: 'City, State',
                          fifthHeading: 'Corporation',
                          sixthHeading: 'Action',
                          tableRowsLit: invoiceController.getInvoiceList,
                          firstHeaderWidth: 0.8,
                          firstRowWidth: 0.8,
                          viewCallBack: (id) async {
                            invoiceController.viewInvoiceList2.clear();
                            invoiceController.viewInvoice(id: id, vendorID: '');
                            Get.to(
                              () => ViewInvoiceScreen(
                                id: id,
                              ),
                            );
                            log('Department Id: ${id.toString()}');
                          },
                        ),
                      ),
                      SizedBox(height: 70.h),
                    ],
                  ),
                ),
        ));
  }
}
