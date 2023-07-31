import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:smokin_joes/WebHandler/DashboardController.dart';
import 'package:smokin_joes/WebHandler/invoice_controller.dart';

class DashBoardFunction {
  static String id = '';

  static findStoreId(storeName) {
    final DashboardController dashboardController = Get.find();
    dashboardController.selectedStore.clear();
    final data = dashboardController.storeList[0].data
        .firstWhere((element) => element['department_name'] == storeName);

    dashboardController.selectedStore.add(data);
    log('store id: ${dashboardController.selectedStore}');
    id = data['id'];
  }
}

class InvoiceFunction {
  static String id = '';

  static findVendorId(vendorName) {
    final InvoiceController invoiceController = Get.find();
    final data = invoiceController.viewInvoiceVendorsList[0].vendor
        .firstWhere((element) => element.vendorName == vendorName);
    id = data.id;

    log('Id of the Selected Vendor: ${id.toString()}');
  }
}

// Internet Connectivity
class InternetConnection {
  Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}

