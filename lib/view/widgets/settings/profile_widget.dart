import 'package:asroo_shop/logic/controllers/settings_controller.dart';
import 'package:asroo_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 100.0,
              width: 100.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: controller.capitalize('mohamed essam'),
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  underline: TextDecoration.none,
                ),
                TextUtils(
                  text: 'mohamed.essam900009@gmail.com',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  underline: TextDecoration.none,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
