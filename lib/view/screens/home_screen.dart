import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../widgets/home/card_items.dart';
import '../widgets/home/search_text_form.dart';
import '../widgets/text_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180.0,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      text: 'Find Your',
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      underline: TextDecoration.none,
                    ),
                    SizedBox(height: 5.0),
                    TextUtils(
                      text: 'Inspiration',
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      underline: TextDecoration.none,
                    ),
                    SizedBox(height: 20.0),
                    SearchTextForm(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  text: 'Categories',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  underline: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
