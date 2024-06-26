import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/product_models.dart';
import '../../services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favoriteList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  // Search
  var searchList = <ProductModels>[].obs;

  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storedShoppings = storage.read<List>('isFavoriteList');

    if (storedShoppings != null) {
      favoriteList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
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

  // logic for favorite
  void manageFavorite(int productId) async {
    var existingIndex =
        favoriteList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favoriteList.removeAt(existingIndex);
      await storage.remove('isFavoriteList');
    } else {
      favoriteList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write('isFavoriteList', favoriteList);
    }
  }

  bool isFavorite(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }

  // Search Bar Logic
  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList('');
  }
}
