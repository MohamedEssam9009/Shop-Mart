import 'package:asroo_shop/view/widgets/cart/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
        body: EmptyCard(),
      ),
    );
  }
}
