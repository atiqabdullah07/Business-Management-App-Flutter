import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smokin_joes/HelperFunctions/local_storage.dart';
import 'package:smokin_joes/Modals/get_user_modal.dart';

import '../../HelperFunctions/alert_functions.dart';
import '../../Modals/standard_pl_report_modal.dart';
import '../api_constant.dart';

class StandardPLReportController extends GetxController {
  RxList standardPLReportList = <GetUserModal>[].obs;

  // @override
  // void onInit() {
  // }

  //get standard p&l report
  Future<void> getstandardPLReport(startDate, endDate) async {
    try {
      var token = LocalStorage().getToken();
      String authToken = 'Bearer $token';
      var headers = {
        'Authorization': authToken
            .toString(), //'Bearer 33|ozey9kKiscxcg7ZAjTwDGRAN3DmhjAdmLrBu3Wz8',
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${ApiConstant.baseUrl}${ApiConstant.getStandardPLReport}',
        ),
      );

      request.fields.addAll({
        'department_id': '12',
        'from_date': '2022-01',
        'to_date': '2022-08'
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        log("\n\n\nget standard pl report response from json decode ${decodeResponse['Message']}");
        log("\n\n\nget standard pl report status from json decode ${decodeResponse['status']}");
        if (decodeResponse['status'] == "200") {
          standardPLReportList.add(
            StandardPLReportModal(
              status: decodeResponse['status'],
              data: decodeResponse['data'],
            ),
          );
          log('length of get standard p&l report: ${standardPLReportList[0].data['Business'].length}');
        } else {
          AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
          log('response status code of get standard p&l report Api didn\'t match: Something went wrong');
        }
      } else {
        log(' run when get standard report status not matched: ${response.reasonPhrase}');
      }
    } catch (e) {
      AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
      log('catch block of get standard pl report: $e');
    }
  }
}
