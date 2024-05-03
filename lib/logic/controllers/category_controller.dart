import '../../models/product_models.dart';
import '../../services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModels>[].obs;

  var isCategoryLoading = false.obs;
  var isAllCategory = false.obs;

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

  getAllCategories(String nameCategory) async {
    isAllCategory(true);
    categoryList.value = await AllCategoryServices.getAllCategory(nameCategory);

    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategories(categoryNameList[index]);
    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}
