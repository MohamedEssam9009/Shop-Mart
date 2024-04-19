import 'package:asroo_shop/logic/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());

    Get.lazyPut(() => CartController());
  }
}
