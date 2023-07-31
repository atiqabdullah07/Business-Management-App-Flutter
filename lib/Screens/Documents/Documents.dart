import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';
import 'package:smokin_joes/Constants/colors.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';
import 'package:smokin_joes/Widgets/AppDrawer.dart';
import 'package:smokin_joes/Widgets/Card2.dart';

import '../../Widgets/Tables/Documents/document_table.dart';
import 'DocumentsDetailPage.dart';

class Documents extends StatelessWidget {
  Documents({Key? key}) : super(key: key);

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
              title: 'Documents',
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Expanded(
                child: Container(
                  height: 35.h,
                  width: 1.sw,
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
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: DocumentTable(
                firstHeading: '#',
                secondHeading: 'Name',
                thirdHeading: 'Category',
                fourthHeading: 'Actions',
                tableRowsLit: DocumentsTableList.documentsTableList,
                firstHeaderWidth: 0.3,
                firstRowWidth: 0.3,
                thirdHeaderWidth: 0.6,
                thirdRowWidth: 0.6,
                fourthHeaderWidth: 0.4,
                fourthRowWidth: 0.4,
                viewCallBack: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentsDetailPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}
