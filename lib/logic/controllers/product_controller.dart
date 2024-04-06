
import 'package:get/get.dart';

import '../../models/product_models.dart';
import '../../services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
