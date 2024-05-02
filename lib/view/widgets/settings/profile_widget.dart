import 'package:asroo_shop/logic/controllers/auth_controller.dart';
import 'package:asroo_shop/logic/controllers/settings_controller.dart';
import 'package:asroo_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});

  final controller = Get.find<SettingsController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        authController.displayUserEmail.value,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 15.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      text: controller
                          .capitalize(authController.displayUserName.value),
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      underline: TextDecoration.none,
                    ),
                    TextUtils(
                      text: authController.displayUserEmail.value,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      underline: TextDecoration.none,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
