import 'package:asroo_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

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
                text: 'Total',
                color: Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                underline: TextDecoration.none,
              ),
              Text(
                '\$680',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: SizedBox(
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 0.0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Check Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.shopping_cart,
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
