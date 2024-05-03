import '../widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextUtils(
                  text: 'Category',
                  color: Get.isDarkMode ? Colors.white : Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  underline: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            CategoryWidget()
          ],
        ),
      ),
    );
  }
}
