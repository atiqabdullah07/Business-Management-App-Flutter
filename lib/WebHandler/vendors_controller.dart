import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smokin_joes/HelperFunctions/alert_functions.dart';
import 'package:smokin_joes/Modals/vendors_modal.dart';

import '../HelperFunctions/local_storage.dart';
import 'api_constant.dart';

class VendorsController extends GetxController {
  // late TextEditingController businessNameController;
  // late TextEditingController stateController;
  // late TextEditingController cityController;
  // late TextEditingController corporationController;

  RxList viewVendorsList = <VendorsModal>[].obs;

  TextEditingController businessNameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController corporationController = TextEditingController();

  @override
  void onInit() {
    // TextEditingController businessNameController = TextEditingController();
    // TextEditingController stateController = TextEditingController();
    // TextEditingController cityController = TextEditingController();
    // TextEditingController corporationController = TextEditingController();
    // TODO: implement onInit
  }

  //add business
  Future<void> getVendors() async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authToken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      var request = http.MultipartRequest(
          'GET', Uri.parse('${ApiConstant.baseUrl}${ApiConstant.getVendors}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        log("\n\n\nget vendors response from json decode ${decodeResponse['Data'].length}");
        log("\n\n\nget vendors status from json decode ${decodeResponse['status'].runtimeType}");
        if (decodeResponse['status'] == 200) {
          for (var i = 0; i < decodeResponse['Data'].length; i++) {
            viewVendorsList.add(
              VendorsModal(
                id: decodeResponse['Data'][i]['id'],
                vendorName: decodeResponse['Data'][i]['vendor_name'],
                vendorType: decodeResponse['Data'][i]['vendor_type'],
                departmentName: decodeResponse['Data'][i]['department_name'],
              ),
            );
          }
        } else {
          AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
          log('response status code of get vendor Api didn\'t match: Something went wrong');
        }
      } else {
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log('catch block of get vendors run: $e');
      AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
    }
  }
}
