import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smokin_joes/HelperFunctions/local_storage.dart';
import 'package:smokin_joes/Modals/detailed_pl_report_modal.dart';

import '../../HelperFunctions/alert_functions.dart';
import '../DashboardController.dart';
import '../api_constant.dart';

class DetailedPLReportController extends GetxController {
  RxBool isLoading = false.obs;
  String? departmentId;
  RxString selectedStoreName = ''.obs;
  DateTime? startDate;
  DateTime? endDate;
  RxList detailedBusinessPLReportList = <DetailedPLReportModal>[].obs;
  RxList detailedCreditPLReportList = <DetailedPLReportModal>[].obs;
  RxList detailedDebitPLReportList = <DetailedPLReportModal>[].obs;
  //selected store
  RxList selectedStore = [].obs;

  // @override
  // void onInit() {
  // }

  Future<void> updateStartDate(date) async {
    startDate = date;
    update();
  }

  Future<void> updateEndDate(date) async {
    endDate = date;
    update();
  }

  Future<void> updateDepartmentId(id) async {
    log('selected department id: $id');
    departmentId = id;
    update();
  }

  //get detailed p&l report
  Future<void> getDetailedPLReport(
      {required String departmentId,
      required String startDate,
      required String endDate}) async {
    isLoading.value = true;
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authtoken: $authToken');
      var headers = {
        'Authorization': authToken,
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${ApiConstant.baseUrl}${ApiConstant.getDetailedPLReport}',
        ),
      );

      request.fields.addAll({
        'department_id': departmentId,
        'from_date': startDate,
        'to_date': endDate,
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        log("\n\n\nget detailed pl report response from json decode ${decodeResponse['Business']}");
        log("\n\n\nget detailed pl report status from json decode ${decodeResponse['Status']}");
        if (decodeResponse['Status'] == "200") {
          detailedBusinessPLReportList.clear();
          detailedCreditPLReportList.clear();
          detailedDebitPLReportList.clear();
          //detailed business list
          detailedBusinessPLReportList.add(
            DetailedPLReportModal(
              status: decodeResponse['Status'],
              data: decodeResponse['Business'],
            ),
          );

          //detailed cheque credit list
          detailedCreditPLReportList.add(
            DetailedPLReportModal(
              status: decodeResponse['Status'],
              data: decodeResponse['Cheque_Credit'],
            ),
          );

          //detailed debit list
          detailedDebitPLReportList.add(
            DetailedPLReportModal(
              status: decodeResponse['Status'],
              data: decodeResponse['Cheque_Debit'],
            ),
          );
          Future.delayed(const Duration(seconds: 1));
          isLoading.value = false;
          log('length of get detailed business p&l report: ${detailedBusinessPLReportList[0].data.length}');
          log('length of get detailed credit p&l report: ${detailedCreditPLReportList[0].data.length}');
          log('length of get detailed debit p&l report: ${detailedDebitPLReportList[0].data.length}');
        } else {
          isLoading.value = false;
          AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
          log('response status code of get detailed p&l report Api didn\'t match: Something went wrong');
        }
      } else {
        isLoading.value = false;
        log(' run when get detailed report status not matched: ${response.reasonPhrase}');
      }
    } catch (e) {
      isLoading.value = false;
      AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
      log('catch block of get detailed pl report: $e');
    }
  }

  //find departemnt store
  Future<void> findStoreId(storeName) async {
    final DashboardController dashboardController = Get.find();
    selectedStore.clear();
    final data = dashboardController.storeList[0].data
        .firstWhere((element) => element['department_name'] == storeName);
    updateDepartmentId(data['id']);
    selectedStore.add(data);
    log('detailed p&l report selected store data: $data');
  }
}
