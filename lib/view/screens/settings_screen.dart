import 'package:asroo_shop/utils/theme.dart';
import 'package:asroo_shop/view/widgets/settings/profile_widget.dart';
import 'package:asroo_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/settings/dark_mode_widget.dart';
import '../widgets/settings/language_widget.dart';
import '../widgets/settings/logout_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(height: 10.0),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2.0,
          ),
          const SizedBox(height: 20.0),
          TextUtils(
            text: 'GENERAL',
            color: Get.isDarkMode ? pinkClr : mainColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            underline: TextDecoration.none,
          ),
          const SizedBox(height: 20.0),
          DarkModeWidget(),
          const SizedBox(height: 20.0),
          LanguageWidget(),
          const SizedBox(height: 20.0),
          LogOutWidget(),
        ],
      ),
    );
  }
}
