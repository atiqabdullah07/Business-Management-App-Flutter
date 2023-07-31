import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smokin_joes/HelperFunctions/local_storage.dart';
import 'package:smokin_joes/Screens/BottomNavigationBar.dart';
import 'package:smokin_joes/WebHandler/DashboardController.dart';

import 'HelperFunctions.dart';
import 'alert_functions.dart';

class LoginValidation {
  final LocalStorage localStorage = LocalStorage();
  final DashboardController dashboardController = Get.find();

  emailValidator({required String email}) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  Future<void> validation(
      {required String email,
      required String password,
      BuildContext? context}) async {
    var connection = await InternetConnection().checkConnectivity();
    if (emailValidator(email: email) && password.length >= 8) {
      if (connection == true) {
        AlertFunctions.showEasyLoader();
        await dashboardController.login(email: email, password: password).then((
              response,
            ) =>
                {
                  log('return response: ${response.runtimeType}'),
                  if (response != null)
                    {
                      LocalStorage().storeSession(
                          userObject: response['User'],
                          userToken: response['Token'].toString()),
                      AlertFunctions.successSnackBar(
                        "Logged in successfully",
                        "Welcome Back! ",
                      ),
                      Get.off(() => const BNB()),
                    }
                });
        AlertFunctions.dismissEasyLoader();
        // sharedPreferencesController.storeSession(email: email);
        // localStorage.storeSession(email: email);
        // dashboardController.disposeController();

        // Get.offAllNamed(Routes.planningTeamDashboard);
      } else {
        AlertFunctions.warningSnackBar(
          "You are offline",
          "Check your internet connection! ",
        );
      }
    } else if (email.isNotEmpty && !emailValidator(email: email)) {
      // dashboardController.emailController.clear();
      AlertFunctions.warningSnackBar(
        'Provide valid email',
        'Try Again',
      );
    } else if (email.isEmpty && password.isEmpty) {
      AlertFunctions.warningSnackBar(
        'Provide email and password',
        'Try Again',
      );
    } else if (email.isEmpty || password.isEmpty) {
      if (email.isEmpty && password.isNotEmpty) {
        AlertFunctions.warningSnackBar(
          'The email field is required',
          'Please fill',
        );
      } else if (email.isNotEmpty && password.isEmpty) {
        AlertFunctions.warningSnackBar(
          'The password field is required',
          'Please fill',
        );
      }
    } else if (password.length < 8) {
      AlertFunctions.warningSnackBar(
        'Password must be of 8 character long',
        'Try Again',
      );
    } else {
      AlertFunctions.warningSnackBar(
        'All fields are required',
        'Try Again',
      );
    }
  }
}
