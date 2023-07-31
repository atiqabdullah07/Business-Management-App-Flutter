import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/colors.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final double width;
  const SearchTextField({
    Key? key,
    this.textEditingController,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
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
            controller: textEditingController,
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
    );
  }
}
