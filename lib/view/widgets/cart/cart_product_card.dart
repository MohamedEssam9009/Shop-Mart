import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../models/product_models.dart';
import '../../../utils/theme.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final controller = Get.find<CartController>();
  final int index;
  final int quantity;

  CartProductCard(
      {super.key,
      required this.productModels,
      required this.index,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
      height: 130.0,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120.0,
            width: 100.0,
            margin: const EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(productModels.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  '\$${controller.productSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductsFromCart(productModels);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModels);
                },
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? Colors.black : Colors.red,
                  size: 20.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
