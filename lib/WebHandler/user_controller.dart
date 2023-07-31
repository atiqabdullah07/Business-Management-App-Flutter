import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smokin_joes/HelperFunctions/alert_functions.dart';
import 'package:smokin_joes/HelperFunctions/local_storage.dart';
import 'package:smokin_joes/Modals/get_user_modal.dart';

import 'DashboardController.dart';
import 'api_constant.dart';

class UsersController extends GetxController {
  RxList viewUsersList = <GetUserModal>[].obs;
  String multiselectItemsString = '';
  List<String> selectedStore = [];
  List<String> selectedStoreIds = [];
  RxBool isUpdated = false.obs;
  RxString privilegeDropDownValue = 'Edit'.obs;
  String id = '';

  @override
  void onInit() {
    getUsers();
  }

  Future<void> editUserPrivilege(
      {required String id, required String? privilege}) async {
    var token = LocalStorage().getToken();
    log('get user token: $token');
    String authToken = 'Bearer $token';
    var headers = {
      'Authorization': authToken,
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('https://prerak420.com/api/update-user-privilege/$id'));
    if (privilege != null) {
      request.fields.addAll({
        'status': 'View',
      });
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar(
        'Privilege',
        'Updated Successfully',
      );
      await getUsers();

      log(await response.stream.bytesToString());
    } else {
      log(response.reasonPhrase.toString());
    }
    log(response.statusCode.toString());
  }

  //add business
  Future<void> getUsers() async {
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
          viewUsersList.clear();
          viewUsersList.add(
            GetUserModal(
              status: decodeResponse['status'],
              data: decodeResponse['data'],
            ),
          );
          log('length of users: ${viewUsersList[0].data.length}');
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
  Future<void> updateUserBusiness(
      {required String userID, required String departmentsIds}) async {
    try {
      var headers = {
        'Authorization': 'Bearer 569|5hr8xwpl6TtD21Ksusd00NeeWX9ByNX0mvKhwgPU',
      };
      var request = http.MultipartRequest('POST',
          Uri.parse('https://prerak420.com/api/update-user-business/$userID'));
      request.fields.addAll({'department_id[]': departmentsIds});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        isUpdated.value = true;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Catch of updateBusiness: ${e.toString()}');
    }
  }

  findStoreId(storeName) {
    final DashboardController dashboardController = Get.find();
    final data = dashboardController.storeList[0].data
        .firstWhere((element) => element['department_name'] == storeName);
    log('selected store ids: ${data['id']}');

    selectedStoreIds.add(data['id']);

    // selectedStoreIds.add()
  }

  void splitStringToList(itemsString) {
    selectedStore.clear();
    selectedStore = itemsString.split(',');
    update();
  }
}
