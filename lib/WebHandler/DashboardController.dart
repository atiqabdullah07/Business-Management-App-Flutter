import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smokin_joes/Modals/get_store_modal.dart';
import 'package:smokin_joes/WebHandler/api_constant.dart';

import '../HelperFunctions/alert_functions.dart';
import '../HelperFunctions/local_storage.dart';

class DashboardController extends GetxController {
  RxList storeList = <GetStoreModal>[].obs;
  RxList<String> storeName = <String>[].obs;
  RxString isMonthlyOrYearlyData = 'Monthly'.obs;
  RxString isMonthOrYear = 'January'.obs;
  RxList selectedStore = [].obs;
  RxString selectedStoreName = ''.obs;
  RxList mappingSettingList = [].obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  onInit() async {
    super.onInit();
    mappingSetting();
  }

  Future login({required String email, required String password}) async {
    try {
      log('emailController: $email');
      log('passwordController: $password');
      var request = http.MultipartRequest(
          'POST', Uri.parse('${ApiConstant.baseUrl}/login'));
      request.fields.addAll({'email': email, 'password': password});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        log('\n\nresoponse from loging api: $decodeResponse');
        if (decodeResponse['Status'] == '200') {
          return decodeResponse;
        } else {
          AlertFunctions.warningSnackBar('${decodeResponse['error']}', '');
        }
      } else {
        log('\n\nlogin Api reason phrase: ${response.reasonPhrase}\n\n');
      }
    } catch (e) {
      AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
      log('catch block of login Api: Something went wrong');
    }
  }

  Future<void> fetchStore() async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authtoken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      http.Request request = http.Request('Get',
          Uri.parse('${ApiConstant.baseUrl}${ApiConstant.departmentStore}'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        log("response from department api after json decode: ${decodeResponse["Department"]}");
        if (decodeResponse['status'] == '200') {
          storeList.clear();
          storeList.add(
            GetStoreModal(
              status: decodeResponse['status'],
              data: decodeResponse["Department"],
            ),
          );

          List<String> newStoreItem = [];
          for (var i = 0; i < decodeResponse["Department"].length; i++) {
            newStoreItem.add(
                decodeResponse["Department"][i]['department_name'].toString());
          }
          storeName.value = newStoreItem.toSet().toList();
          log('length of store list and store name: ${storeList[0].data.length} ${storeName.length}');
        } else {
          log('status code not match');
        }
      } else {
        print('response.reasonPhrase: ${response.reasonPhrase}');
      }
    } catch (e) {
      AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
      log('catch block of departement Api: Something went wrong');
    }
  }

  // get dashboard details on a montly or yearly basis

  Future<void> getDashboardDetailsByMonthlyOrYearlyBasis({
    required String qryType,
    required String type,
    required String department,
    required String? month,
    required String? year,
  }) async {
    var headers = {
      'Authorization': '206|QHLGuQhH0amLBKCMNRYLfwMbIkx9QzU0MPwXMp47',
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${ApiConstant.baseUrl}${ApiConstant.dashDetails}'),
    );
    if (month != null) {
      request.fields.addAll({
        'qry_type': '2',
        'type': type.toLowerCase(),
        'department': department,
        'month': month,
      });
    } else if (year != null) {
      request.fields.addAll({
        'qry_type': '2',
        'type': type.toLowerCase(),
        'department': department,
        'year': year,
      });
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log('\n\nget dashboard businesses: ${await response.stream.bytesToString()}\n\n');
    } else {
      log(response.reasonPhrase.toString());
    }
  }

  Future<void> mappingSetting(
      {String? departmentId, String? type, String? year, String? month}) async {
    // try {
    var headers = {
      'Authorization': 'Bearer 206|QHLGuQhH0amLBKCMNRYLfwMbIkx9QzU0MPwXMp47'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('${ApiConstant.baseUrl}${ApiConstant.mappingSetting}'));
    request.fields.addAll({
      'department_id': departmentId ?? '2',
      'type': type ?? '',
      'year': year ?? '',
      'month': month ?? '',
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final decodeResponse = json.decode(await response.stream.bytesToString());
      log("mapping setting response from json decode $decodeResponse");
      if (decodeResponse['status'] == '200') {
        Get.snackbar('title', 'if run');
        mappingSettingList.add(decodeResponse);
        // mappingSettingList.add(
        //   MappingSettingModel(
        //     totalBusiness: decodeResponse['total_business'],
        //     lotterySold: decodeResponse['lottery_sold'],
        //     lotteryCommission: decodeResponse['lottery_commission'],
        //     vendorTypes: decodeResponse['vendor_types'],
        //     status: decodeResponse['status'],
        //   ),
        // );
        log('\n\n\n\n\n\n\n\n\n\n\n\nmapping setting list value: ${mappingSettingList[0].length}');
      }
    } else {
      log(response.reasonPhrase.toString());
    }
    // } catch (e) {
    //   AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
    // }
  }
}
