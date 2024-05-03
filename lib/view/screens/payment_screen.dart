import 'package:asroo_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../widgets/payment/delivery_container_widget.dart';
import '../widgets/payment/payment_method_widget.dart';

class PayMentScreen extends StatelessWidget {
  const PayMentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: 'Shipping to',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                underline: TextDecoration.none,
              ),
              const SizedBox(height: 20.0),
              const DeliveryContainerWidget(),
              const SizedBox(height: 20.0),
              TextUtils(
                text: 'Payment method',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                underline: TextDecoration.none,
              ),
              const SizedBox(height: 20.0),
              const PaymentMethodWidget(),
              const SizedBox(height: 30.0),
              Center(
                child: TextUtils(
                  text: 'Total: 200\$',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  underline: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: SizedBox(
                  height: 50.0,
                  width: 150.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
