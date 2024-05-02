import 'package:asroo_shop/logic/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Get.isDarkMode
              ? pinkClr.withOpacity(0.4)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12.0),
          customBorder: const StadiumBorder(),
          onTap: () {
            Get.defaultDialog(
              title: 'Logout From App',
              titleStyle: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              middleText: 'Are you sure to need to logout',
              middleTextStyle: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.grey,
              radius: 10.0,
              textCancel: 'No',
              cancelTextColor: Colors.white,
              textConfirm: 'Yes',
              confirmTextColor: Colors.white,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                controller.signOutFromApp();
              },
              buttonColor: Get.isDarkMode ? pinkClr : mainColor,
            );
          },
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20.0),
              TextUtils(
                text: 'Logout'.tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                underline: TextDecoration.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
