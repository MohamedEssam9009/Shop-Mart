import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/theme.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150.0,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(height: 40.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Your Cart is ',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Empty',
                  style: TextStyle(
                    color: Get.isDarkMode ? pinkClr : mainColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Add items to get Started',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50.0),
          SizedBox(
            height: 50.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 0.0,
                backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
              ),
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
              child: const Text(
                'Go to Home',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
