import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smokin_joes/Constants/Drop_Down_Lists.dart';

import '../HelperFunctions/local_storage.dart';
import '../Modals/get_business_model.dart';
import 'api_constant.dart';

class BusinessController extends GetxController {
  RxList viewBusinessList = <GetBusinessModal>[].obs;

  TextEditingController businessNameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController corporationController = TextEditingController();
  TextEditingController updateBusinessNameController = TextEditingController();
  TextEditingController updateBusinessstateController = TextEditingController();
  TextEditingController updateBusinesscityController = TextEditingController();
  TextEditingController updateBusinesscorporationController =
      TextEditingController();
  RxString categoryDropDownValue = 'Gas Station'.obs;
  RxString categoryDropDownValueEditBusiness = 'Gas Station'.obs;
  String id = '10000';

  RxString businessUpdateInitialValue = filter.category[0].obs;
  String imagePath = '';

  @override
  onInit() async {
    super.onInit();
    viewBusiness();
  }

  uploadImage() async {
    var request = http.MultipartRequest("POST",
        Uri.parse('${ApiConstant.baseUrl}${ApiConstant.insertBusiness}'));

    var token = await LocalStorage().getToken();
    String authToken = 'Bearer 176|y1WOttTpTLWTnmnhdhx03IEj9cFVl0yVDtjKdXut';
    log('authtoken: $authToken');
    var headers = {
      'Authorization': authToken,
    };

    var picture = http.MultipartFile.fromBytes(
        'image', (await rootBundle.load((imagePath))).buffer.asUint8List(),
        filename: imagePath);

    request.files.add(picture);

    var response = await request.send();

    var responseData = await response.stream.toBytes();

    var result = String.fromCharCodes(responseData);

    print(result);
  }

  //update Business
  Future<void> updateBusiness({required String id}) async {
    var headers = {
      'Authorization': 'Bearer 150|vvAbWZwMSoYCiocnkNmmn0bmoKT8sZ9Kfxbm4EZ1'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://prerak420.com/api/update-business/$id'));
    request.fields.addAll({
      'name': updateBusinessNameController.text,
      'category': categoryDropDownValueEditBusiness.value,
      'state': updateBusinessstateController.text,
      'city': updateBusinesscityController.text,
      'corporation_name': updateBusinesscorporationController.text
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201 || response.statusCode == 200) {
      Get.snackbar(
        'Business',
        'Updated Successfully',
      );
      updateBusinessNameController.clear();
      updateBusinessstateController.clear();
      updateBusinesscityController.clear();
      updateBusinesscorporationController.clear();
      await viewBusiness();
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  //add business
  Future<void> insertBusiness() async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authtoken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${ApiConstant.baseUrl}${ApiConstant.insertBusiness}'),
      );
      // uploadImage();
      request.fields.addAll({
        'name': businessNameController.text,
        'category': categoryDropDownValue.value,
        'state': stateController.text,
        'city': cityController.text,
        'corporation_name': corporationController.text,
        // 'department_image': imagePath
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201 || response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        Get.snackbar(
          'Business',
          'Added Successfully',
        );
        businessNameController.clear();
        stateController.clear();
        cityController.clear();
        corporationController.clear();
        await viewBusiness();
        if (decodeResponse['status'] == '200') {
          log('\nsuccess result response from insert business api: $decodeResponse\n\n');
        }
      } else {
        log('\n\nError response from insert business api: ${response.reasonPhrase}\n\n');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //view business
  Future<void> viewBusiness() async {
    try {
      var request = http.MultipartRequest('GET',
          Uri.parse('${ApiConstant.baseUrl}${ApiConstant.viewBusiness}'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        if (decodeResponse['status'] == '200') {
          viewBusinessList.clear();
          for (var i = 0; i < decodeResponse['data'].length; i++) {
            viewBusinessList.add(GetBusinessModal(
              id: decodeResponse['data'][i]['id'],
              name: decodeResponse['data'][i]['department_name'],
              category: decodeResponse['data'][i]['category'],
              city: decodeResponse['data'][i]['city'],
              state: decodeResponse['data'][i]['state'],
              corporation: decodeResponse['data'][i]['corporation_name'],
            ));
          }
        }
      } else {
        log('\n\nerror when getting data from view_business api: ${response.reasonPhrase.toString()}\n\n');
      }
    } catch (e) {
      log('cach block of view business run: $e');
    }
  }
}
