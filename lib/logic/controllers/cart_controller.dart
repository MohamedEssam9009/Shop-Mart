import 'package:asroo_shop/models/product_models.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productMap.containsKey(productModels)) {
      productMap[productModels] += 1;
    } else {
      productMap[productModels] = 1;
    }
  }

  void removeProductsFromCart(ProductModels productModels) {
    if (productMap.containsKey(productModels) &&
        productMap[productModels] == 1) {
      productMap.removeWhere((key, value) => key == productModels);
    } else {
      productMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    productMap.clear();
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
