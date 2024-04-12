import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../widgets/cart/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
              onPressed: () {},
              icon: const Icon(Icons.backspace),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 600.0,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const CartProductCard();
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20.0),
                  itemCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
