import 'package:get/get.dart';
import 'package:smokin_joes/WebHandler/user_controller.dart';
import 'package:smokin_joes/WebHandler/vendors_controller.dart';

import '../WebHandler/DashboardController.dart';
import '../WebHandler/ReportController/detailed_p&l_controller.dart';
import '../WebHandler/business_controller.dart';
import '../WebHandler/invoice_controller.dart';
import '../WebHandler/test_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(BusinessController());
    Get.put(VendorsController());
    Get.put(TestController());
    Get.put(UsersController());
    Get.put(DetailedPLReportController());
    Get.put(InvoiceController());
    Get.put(DashboardController());
  }
}
