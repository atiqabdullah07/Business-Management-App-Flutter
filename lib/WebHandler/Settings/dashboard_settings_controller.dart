import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smokin_joes/Modals/Settings/dashboard_settings_model.dart';
import 'package:smokin_joes/WebHandler/DashboardController.dart';

import '../../HelperFunctions/local_storage.dart';

class DashboardSettingsController extends GetxController {
  final DashboardController dashboardController = Get.find();
  RxList getDashboardSettingsList2 = <DashboardSettingsModel2>[].obs;
  RxString selectedStoreName = ''.obs;
  RxBool isLoader = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    // getDashboardSettings();
    selectedStoreName.value =
        dashboardController.storeList[0].data[0]['department_name'].toString();
    super.onInit();
  }

  Future<void> changeSettingStatus(
      {required String settingsID, required String departmentID}) async {
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
              'https://prerak420.com/api/settings_status?department_id=$departmentID&setting_id=$settingsID'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Catch of changeSettingsStatus: ${e.toString()}');
    }
  }

  Future<void> getDashboardSettings({required String id}) async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authtoken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://prerak420.com/api/settings'));
      request.fields.addAll({'department_id': id});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        getDashboardSettingsList2.clear();
        if (decodeResponse['Status'] == '200') {
          for (int i = 0; i < decodeResponse['dashbord_setting'].length; i++) {
            getDashboardSettingsList2.add(DashboardSettingsModel2(
                id: decodeResponse['dashbord_setting'][i]["id"] ?? '',
                settingID: decodeResponse['dashbord_setting'][i]["setting_id"],
                departmentID: decodeResponse['dashbord_setting'][i]
                        ["department_id"] ??
                    '',
                status: decodeResponse['dashbord_setting'][i]["status"] == "1"
                    ? decodeResponse['dashbord_setting'][i]["status"]
                    : "0",
                settingName: decodeResponse['dashbord_setting'][i]
                    ["setting_name"]));
          }
        }

        log(decodeResponse.toString());
        // log('Get DashboardSettings List: $getDashboardSettingsList');
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Catch of getDashboardSettings: ${e.toString()}');
    }
  }
}
