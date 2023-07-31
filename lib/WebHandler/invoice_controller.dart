import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:smokin_joes/Modals/invoice_model.dart';
import 'package:smokin_joes/Modals/view_invoice_model.dart';

import '../HelperFunctions/alert_functions.dart';
import '../HelperFunctions/local_storage.dart';
import '../Modals/Invoice/invoive_vendor_model.dart';
import 'api_constant.dart';

class InvoiceController extends GetxController {
  RxList getInvoiceList = <GetInvoiceModal>[].obs;
  RxList viewInvoiceList2 = <ViewInvoiceModel2>[].obs;
  RxString selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxList<String> vendorDropDownItems = <String>[].obs;
  RxList viewInvoiceVendorsList = <InvoiceVendorsModal>[].obs;
  RxString selectedItemFromAddInvoiceDialogue = ''.obs;
  RxString selectedItemFromViewInvoiceScreen = ''.obs;
  List<XFile>? imageFileList = [];
  RxList<String> imagePathList = <String>[].obs;

  @override
  onInit() async {
    super.onInit();
    await getInvoice();
  }

  Future<void> viewInvoice(
      {required String id, required String vendorID}) async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authtoken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://prerak420.com/api/get_invoices_vendor'));
      request.fields
          .addAll({'department_id': id, 'vendor_filter_id': vendorID});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        if (decodeResponse['Status'] == '200') {
          viewInvoiceList2.clear();
          viewInvoiceList2.add(ViewInvoiceModel2.fromJson(decodeResponse));
          log('\n\n\n\nView Invoice List: $viewInvoiceList2');
          log('\n\n Vendor Name: ${viewInvoiceList2[0].data[0].vendorName.toString()}');
          log('Response: ${response.statusCode}');
        } else {
          log('response.statusCode of get_invoices_vendor: ${response.reasonPhrase.toString()}');
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Catch Block of get_invoices_vendor:  ${e.toString()}');
    }
  }

  //view business
  Future<void> getInvoice() async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authtoken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      var request = http.MultipartRequest(
          'GET', Uri.parse('http://prerak420.com/api/business-invoice-view'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        if (decodeResponse['Status'] == '200') {
          for (var i = 0; i < decodeResponse["data"].length; i++) {
            getInvoiceList.add(GetInvoiceModal(
              id: decodeResponse["data"][i]["department_id"],
              name: decodeResponse["data"][i]["department_name"],
              category: decodeResponse["data"][i]["category"],
              city: decodeResponse["data"][i]["city"],
              state: decodeResponse["data"][i]["state"],
              corporation: decodeResponse["data"][i]["corporation_name"],
            ));
          }
          log(decodeResponse['data'].toString());
          log('View Invoice List: $getInvoiceList');
        } else {
          log(response.reasonPhrase.toString());
        }
      }
    } catch (e) {
      log('Catch block of view Invoice run: $e');
    }
  }

  //Get Invoice Vendor
  Future<void> getVendors({required String departmentID}) async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authToken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      var request = http.MultipartRequest('POST',
          Uri.parse('${ApiConstant.baseUrl}${ApiConstant.getInvoiceVendors}'));

      request.fields.addAll({'department_id': departmentID});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final decodeResponse =
            json.decode(await response.stream.bytesToString());
        log("\n\n\nget vendors response from json decode ${decodeResponse['vendor'].length}");
        log("\n\n\nget vendors status from json decode ${decodeResponse['status'].runtimeType}");
        if (decodeResponse['status'] == '200') {
          viewInvoiceVendorsList.clear();
          vendorDropDownItems.clear();
          vendorDropDownItems.add('Select Vendor');
          for (var i = 0; i < decodeResponse['vendor'].length; i++) {
            viewInvoiceVendorsList
                .add(InvoiceVendorsModal.fromJson(decodeResponse));
            vendorDropDownItems.add(decodeResponse['vendor'][i]['vendor_name']);
          }
        } else {
          AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
          log('response status code of get invoice vendor Api didn\'t match: Something went wrong');
        }
      } else {
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log('catch block of get invoice vendors run: $e');
      AlertFunctions.errorSnackBar('Something went wrong', 'Try again');
    }
  }

  Future<void> insertInvoice(
      {required String date,
      required String vendorID,
      required String departmentID}) async {
    try {
      var token = await LocalStorage().getToken();
      String authToken = 'Bearer $token';
      log('authtoken: $authToken');
      var headers = {
        'Authorization': authToken,
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://prerak420.com/api/insert_invoice'));
      request.fields.addAll({
        'date': date,
        'vendor_id': vendorID,
        'department_id': departmentID,
      });

      for (int i = 0; i < imagePathList.length; i++) {
        request.files.add(await http.MultipartFile.fromPath(
            'file[]', imagePathList.elementAt(i)));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());

        AlertFunctions.successSnackBar('Invoice ', 'Added Successfully');

        //  imagePth.value = '';
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Catch of InsertInvoice: ${e.toString()}');
    }
  }

  Future<void> deleteInvoice({required String invoiceID}) async {
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
              'https://prerak420.com/api/delete_invoice_by_id/$invoiceID'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        AlertFunctions.successSnackBar('Invoice ', 'Deleted Successfully');

        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Catch of deleteInvoice: ${e.toString()}');
    }
  }
}
