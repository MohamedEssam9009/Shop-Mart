import 'package:asroo_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../widgets/payment/delivery_container_widget.dart';

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
              // Payment Method Widget
              const SizedBox(height: 30.0),
              // Total button
            ],
          ),
        ),
      ),
    );
  }
}
