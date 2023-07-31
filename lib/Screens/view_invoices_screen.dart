import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smokin_joes/HelperFunctions/HelperFunctions.dart';
import 'package:smokin_joes/WebHandler/invoice_controller.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/search_textfield.dart';

import '../Constants/colors.dart';
import '../HelperFunctions/alert_functions.dart';
import '../Widgets/AlertDialogue/add_invoice_dialogue.dart';
import '../Widgets/Button.dart';
import '../Widgets/CARD3.dart';
import '../Widgets/DropDown/static_drop_down.dart';
import '../Widgets/Tables/view_invoice_datatable.dart';

class ViewInvoiceScreen extends StatefulWidget {
  final String id;

  const ViewInvoiceScreen({Key? key, required this.id}) : super(key: key);
  static final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  State<ViewInvoiceScreen> createState() => _ViewInvoiceScreenState();
}

class _ViewInvoiceScreenState extends State<ViewInvoiceScreen> {
  final InvoiceController invoiceController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    getInvoiceVendor();
    invoiceController.viewInvoice(id: widget.id, vendorID: '');

    super.initState();
  }

  Future<void> getInvoiceVendor() async {
    await invoiceController.getVendors(departmentID: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: ViewInvoiceScreen._key,
        backgroundColor: AppColors.background,
        appBar: APPBAR(ontap: () {
          ViewInvoiceScreen._key.currentState!.openDrawer();
        }),
        drawer: const AppDrawer(),
        body: Obx(
          () => invoiceController.viewInvoiceList2.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const CARD3(
                        ImagePath: "Images/Group 338.svg",
                        title: 'View ',
                        subTitle: 'Invoices',
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: StaticDropDown(
                            width: 1.sw,
                            backgroundColor: AppColors.primary,
                            textColor: Colors.black,
                            dropdownHeight: 0.5.sh,
                            initialValue: invoiceController
                                        .selectedItemFromViewInvoiceScreen
                                        .value ==
                                    ''
                                ? invoiceController.vendorDropDownItems[0]
                                    .toString()
                                : invoiceController
                                    .selectedItemFromViewInvoiceScreen.value,
                            dropDownItems:
                                invoiceController.vendorDropDownItems,
                            isAlternativeColor: false,
                            onChangeValue: (value) async {
                              invoiceController
                                  .selectedItemFromViewInvoiceScreen
                                  .value = value;

                              InvoiceFunction.findVendorId(value);
                              log('\n\n\n Id of selected Vendor: ${InvoiceFunction.id}');
                              invoiceController.viewInvoiceList2.clear();
                              await invoiceController.viewInvoice(
                                  id: widget.id, vendorID: InvoiceFunction.id);
                            },
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: SearchTextField(
                                width: 1.sw,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            AppButton(
                              width: 120.w,
                              title: 'Add Invoice',
                              voidCallback: () {
                                invoiceController.imageFileList!.clear();
                                invoiceController.imagePathList.clear();
                                invoiceController
                                    .selectedItemFromAddInvoiceDialogue
                                    .value = 'Select Vendor';

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddInvoiceDialogue(
                                        saveCallBack: () async {
                                          log('Department ID: ${widget.id}');
                                          log('Date: ${invoiceController.selectedDate}');
                                          log('Vendor Id: ${InvoiceFunction.id}');

                                          if (invoiceController
                                                  .selectedItemFromAddInvoiceDialogue
                                                  .value ==
                                              'Select Vendor') {
                                            AlertFunctions.errorSnackBar(
                                                'Please', 'Select an Item ');
                                          } else if (invoiceController
                                              .imagePathList.isEmpty) {
                                            AlertFunctions.errorSnackBar(
                                                'Please',
                                                'Select at-least 1 File');
                                          } else {
                                            invoiceController.viewInvoiceList2
                                                .clear();

                                            Navigator.of(context).pop(true);
                                            await invoiceController
                                                .insertInvoice(
                                              date: invoiceController
                                                  .selectedDate.value,
                                              vendorID: InvoiceFunction.id,
                                              departmentID: widget.id,
                                            );

                                            await invoiceController.viewInvoice(
                                                id: widget.id, vendorID: '');
                                            invoiceController
                                                .selectedItemFromViewInvoiceScreen
                                                .value = 'Select Vendor';

                                            log('Final Date: ${invoiceController.selectedDate.value}');
                                          }
                                        },
                                      );
                                    });
                              },
                              hight: 33.h,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: ViewInvoiceDataTable(
                          tableRowsLit:
                              invoiceController.viewInvoiceList2[0].data,
                          firstHeading: '#',
                          secondHeading: 'Vendor',
                          thirdHeading: 'Invoice',
                          fourthHeading: 'Date',
                          fifthHeading: 'Action',
                          firstHeaderWidth: 0.8,
                          firstRowWidth: 0.8,
                          departmentID: widget.id,

                          // fourthHeading: 'Action',
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}
