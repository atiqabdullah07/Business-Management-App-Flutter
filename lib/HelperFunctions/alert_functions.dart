import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertFunctions {
  static errorSnackBar(String errorTitle, String errorMessage) {
    return Get.rawSnackbar(
      titleText: Text(
        errorTitle,
        style: GoogleFonts.raleway(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      messageText: Text(
        errorMessage,
        style: GoogleFonts.raleway(
          fontSize: 14.sp,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
      backgroundColor: Colors.red.withOpacity(0.8),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static successSnackBar(String successTitle, String successMessage) {
    return Get.rawSnackbar(
      title: successTitle,
      message: successMessage,
      titleText: Text(
        successTitle,
        style: GoogleFonts.raleway(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      messageText: Text(
        successMessage,
        style: GoogleFonts.raleway(
          fontSize: 14.sp,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
      backgroundColor: Colors.green.withOpacity(0.8),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static warningSnackBar(String warningTitle, String warningMessage) {
    return Get.rawSnackbar(
      titleText: Text(
        warningTitle,
        style: GoogleFonts.raleway(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      messageText: Text(
        warningMessage,
        style: GoogleFonts.raleway(
          fontSize: 14.sp,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
      backgroundColor: Colors.orange.withOpacity(0.8),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static showEasyLoader() {
    return EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.custom,
    );
  }

  static dismissEasyLoader() {
    return EasyLoading.dismiss();
  }
}
