import 'package:asroo_shop/models/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../logic/controllers/product_controller.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                image: controller.productList[index].image,
                price: controller.productList[index].price,
                rate: controller.productList[index].rating.rate,
                productId: controller.productList[index].id,
                productModels: controller.productList[index],
              );
            },
            itemCount: controller.productList.length,
          ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
        ),
        child: Column(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.manageFavorite(productId);
                    },
                    icon: controller.isFavorite(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartController.addProductToCart(productModels);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 140.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                      text: '\$ $price',
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      underline: TextDecoration.none),
                  Container(
                    height: 20.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3.0, right: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                            text: '$rate',
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            underline: TextDecoration.none,
                          ),
                          const Icon(
                            Icons.star,
                            size: 13.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
