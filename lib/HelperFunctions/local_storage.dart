import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  var userEmail = ''.obs;

  storeSession({required dynamic userObject, required String userToken}) async {
    final pref = GetStorage();
    pref.write('userObject', userObject);
    pref.write('userToken', userToken);

    log('user token from get storage: ${pref.read('userToken')}');
    log('user object from get storage: ${pref.read('userObject')}');
    // await prefs.setString('emailPref', email);
  }

  getSessionData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final pref = GetStorage();
    pref.read('emailPref');
    var emailData = prefs.getString('emailPref');
    userEmail.value = emailData ?? 'guses@gmail.com';
  }

  Future getToken() async {
    final pref = GetStorage();
    var token = pref.read('userToken');
    // var token = storage.getString('userToken');
    log('get user token: $token ${token.runtimeType}');
    return token;
  }

  clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final pref = GetStorage();
    pref.remove('emailPref');
    await prefs.clear();
    // Get.toNamed(Routes.loginScreen);
  }

  logOutSession() async {
    clearSharedPreferences();
  }
}
