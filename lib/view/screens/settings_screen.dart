import '../../logic/controllers/auth_controller.dart';
import '../../logic/controllers/theme_controller.dart';
import '../../utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().changeTheme();
              },
              child: Text(
                'Dark Mode',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            GetBuilder<AuthController>(
              builder: (controller) {
                return TextButton(
                  onPressed: () {
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
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
