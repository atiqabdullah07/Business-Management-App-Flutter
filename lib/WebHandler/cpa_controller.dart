import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smokin_joes/HelperFunctions/alert_functions.dart';
import 'package:smokin_joes/HelperFunctions/local_storage.dart';
import 'package:smokin_joes/Modals/get_user_modal.dart';

import 'api_constant.dart';

class CpaController extends GetxController {
  RxList viewUsersList = <GetUserModal>[].obs;

  @override
  void onInit() {}

  //add business
  Future<void> getCpaData() async {
    try {
      var request = http.MultipartRequest(
          'GET', Uri.parse('${ApiConstant.baseUrl}${ApiConstant.viewUser}'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        log("\n\n\nget users response from json decode ${decodeResponse['data'].length}");
        log("\n\n\nget user status from json decode ${decodeResponse['status'].runtimeType}");
        if (decodeResponse['status'] == "200") {
          viewUsersList.add(
            GetUserModal(
              status: decodeResponse['status'],
              data: decodeResponse['data'],
            ),
          );
          log('length of userlist: ${viewUsersList[0].data.length}');
        } else {
          AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
          log('response status code of get user Api didn\'t match: Something went wrong');
        }
      } else {
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
      log('catch block of get user run: $e');
    }
  }

  //update user  business
  Future<void> updateUserBusiness() async {
    var token = LocalStorage().getToken();
    String authToken = 'Bearer $token';
    var headers = {
      'Authorization': authToken,
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('${ApiConstant.baseUrl}${ApiConstant.updateUserBusiness}'));
    request.fields.addAll({'department_id[]': '2,3,4,5'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
