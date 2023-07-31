import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smokin_joes/Modals/Settings/cpa_settings_model.dart';
import 'package:smokin_joes/WebHandler/DashboardController.dart';

import '../../HelperFunctions/local_storage.dart';

class CpaSettingsController extends GetxController {
  final DashboardController dashboardController = Get.find();

  RxString selectedStoreName = ''.obs;
  RxList cpaSettingsList = <Posts>[].obs;
  String activeStatus = '';
  RxBool isLoader = false.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    selectedStoreName.value =
        dashboardController.storeList[0].data[0]['department_name'].toString();
    super.onInit();
  }

  Future<void> changeSettings(
      {required String departmentID, required String settingsID}) async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authtoken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://prerak420.com/api/setting-cpa-mapping?setting_id=$settingsID&department_id=$departmentID'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Catch Block of changeSettings: ${e.toString()}');
    }
  }

  Future<void> getActiveStatus({required String id}) async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authtoken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      var request = http.Request('POST',
          Uri.parse('https://prerak420.com/api/setting-cpa-status/$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());

        activeStatus = decodeResponse['Status'] == 'Deactivated'
            ? 'Deactivated'
            : 'Activated';
        log(activeStatus.toString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Catch Block of getActiveStatus: ${e.toString()}');
    }
  }

  Future<void> getCpaSettings({required String id}) async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authtoken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://prerak420.com/api/cpa/setting'));
      request.fields.addAll({'department_id': id});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        cpaSettingsList.clear();
        if (decodeResponse['status'] == '200') {
          cpaSettingsList.add(Posts.fromJson(decodeResponse));
        }
        log('Cpa Settings List: $cpaSettingsList');
        log('Status Code: ${response.statusCode}');
        log('Status: ${decodeResponse['status']}');
      } else {
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
