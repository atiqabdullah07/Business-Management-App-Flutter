import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Modals/Daily Activity Models/daily_acticity_main_table_mode.dart';

class DailyActivityController extends GetxController {
  String initialBalance = '';
  String endingBalance = '';
  RxList dailyActivityList = <DailyActivityModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDailyActivity();
  }

  Future<void> getDailyActivity() async {
    try {
      var headers = {
        'Authorization': 'Bearer 254|ThUaGbLsGCqxqmXJuERaC9HTkHRFbQNhtSq7Zr8Z'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://prerak420.com/api/daily_activity'));
      request.fields.addAll({'department_id': '', 'date': ''});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());

        initialBalance = decodeResponse['data']["initial_balence"];
        endingBalance =
            decodeResponse['data']["ending_balance"]["ending_balance"];
        log('Initial Balance: ${initialBalance.toString()}');
        log('Ending Balance: ${endingBalance.toString()}');
        log(decodeResponse['data']["amount"].keys.toString());
      } else {
        print(response.reasonPhrase);
      }
      log(response.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
