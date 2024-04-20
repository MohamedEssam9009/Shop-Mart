import '../../logic/controllers/cart_controller.dart';
import '../widgets/cart/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('Cart Items'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(Icons.backspace),
            )
          ],
        ),
        body: Obx(
          () {
            if (controller.productMap.isEmpty) {
              return const EmptyCard();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600.0,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            index: index,
                            productModels:
                                controller.productMap.keys.toList()[index],
                            quantity:
                                controller.productMap.values.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20.0),
                        itemCount: controller.productMap.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
