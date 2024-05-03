import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_models.dart';
import '../../routes/routes.dart';
import '../../utils/theme.dart';

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
    Get.defaultDialog(
      title: 'Clean Products',
      titleStyle: const TextStyle(
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10.0,
      textCancel: 'No',
      cancelTextColor: Colors.white,
      textConfirm: 'Yes',
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
