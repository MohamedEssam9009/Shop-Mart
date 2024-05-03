import 'package:asroo_shop/logic/controllers/payment_controller.dart';
import 'package:asroo_shop/logic/controllers/settings_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(PaymentController(), permanent: true);
  }
}
