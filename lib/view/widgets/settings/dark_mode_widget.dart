import 'package:asroo_shop/utils/theme.dart';
import 'package:asroo_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/settings_controller.dart';
import '../../../logic/controllers/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({super.key});

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch.adaptive(
            activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
            activeColor: Get.isDarkMode ? pinkClr : mainColor,
            value: controller.switchValue.value,
            onChanged: (value) {
              ThemeController().changeTheme();
              controller.switchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20.0),
          TextUtils(
            text: 'Dark mode',
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            underline: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
