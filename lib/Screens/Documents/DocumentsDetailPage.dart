import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/Widgets/AlertDialogue/add_document_dialogue.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/CARD3.dart';
import 'package:smokin_joes/Widgets/Tables/Documents/documents_detail_table.dart';

import '../../Constants/AppText.dart';
import '../../Widgets/Button.dart';

class DocumentsDetailPage extends StatefulWidget {
  const DocumentsDetailPage({Key? key}) : super(key: key);

  @override
  State<DocumentsDetailPage> createState() => _DocumentsDetailPageState();
}

class _DocumentsDetailPageState extends State<DocumentsDetailPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

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
        child: Column(
          children: [
            const CARD3(
                ImagePath: "Images/Group 338.svg",
                title: "Document",
                subTitle: "Details"),
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
                  SizedBox(width: 10.w),
                  AppButton(
                    width: 150.w,
                    title: 'Add Document',
                    voidCallback: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AddDocumentDialogue(
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
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 175.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: AppText(
                            title: 'Date',
                            color: Colors.black,
                            size: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            showDateRangePicker(
                              context: context,
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2222),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                      ],
                    ),
                  ),
                  AppButton(
                    width: 77.w,
                    hight: 33.h,
                    fontSize: 11,
                    title: 'Search',
                    voidCallback: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: DocumentsDetailTable(
                firstHeading: '#',
                secondHeading: 'Title',
                thirdHeading: 'Date',
                fourthHeading: 'View',
                fifthHeading: 'Action',
                tableRowsLit: DocumentsTableList.documentsTableList,
                firstHeaderWidth: 0.3,
                firstRowWidth: 0.3,
                thirdHeaderWidth: 0.6,
                thirdRowWidth: 0.6,
                fourthHeaderWidth: 0.5,
                fourthRowWidth: 0.5,
                fifthHeaderWidth: 0.5,
                fifthRowWidth: 0.5,
              ),
            ),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}
