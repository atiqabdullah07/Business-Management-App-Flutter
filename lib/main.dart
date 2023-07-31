import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smokin_joes/ControllerBinding/controller_binding.dart';

import 'Screens/login.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight
  ]).then((_) {
    runApp(
      ScreenUtilInit(
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
          builder: EasyLoading.init(),
          initialBinding: ControllerBinding(),
          debugShowCheckedModeBanner: false,
          title: "Smoking Joes",
          home: const Login(),
        ),
        designSize: const Size(428, 926),
      ),
    );
    configLoading();
  });
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 4000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = false;
  // ..customAnimation = CustomAnimation();
}
