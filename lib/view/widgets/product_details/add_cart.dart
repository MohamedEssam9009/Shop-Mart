import '../../../logic/controllers/cart_controller.dart';
import '../../../models/product_models.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
  AddCart({super.key, required this.price, required this.productModels});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                text: 'Price',
                color: Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                underline: TextDecoration.none,
              ),
              Text(
                '\$$price',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  height: 1.5,
                ),
              )
            ],
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: SizedBox(
              height: 60.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0.0,
                ),
                onPressed: () {
                  controller.addProductToCart(productModels);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
