import 'package:http/http.dart' as http;

import '../models/category_model.dart';
import '../models/product_models.dart';
import '../utils/my_string.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load Category');
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModels>> getAllCategory(String categoryNames) async {
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}
