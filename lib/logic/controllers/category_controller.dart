import 'package:asroo_shop/services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
   List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categoryName = await CategoryServices.getCategory();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  // void getProductFromCategory({required String categoryName}) async {
  //   var productFromCategory = await CategoryServices.getProductFromCategory(
  //       categoryName: categoryName);
  // }
}
