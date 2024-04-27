import 'package:asroo_shop/utils/theme.dart';
import 'package:asroo_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: ListView(
        children: [
          // ProfileImage(),
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
          //DarkModeWidget(),
          const SizedBox(height: 20.0),
          //LanguageWidget(),
          const SizedBox(height: 20.0),
         // LogOutWidget(),
        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           ThemeController().changeTheme();
      //         },
      //         child: Text(
      //           'Dark Mode',
      //           style: TextStyle(
      //             color: Get.isDarkMode ? Colors.white : Colors.black,
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 20.0),
      //       GetBuilder<AuthController>(
      //         builder: (controller) {
      //           return TextButton(
      //             onPressed: () {
      //               Get.defaultDialog(
      //                 title: 'Logout From App',
      //                 titleStyle: const TextStyle(
      //                   fontSize: 18.0,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //                 middleText: 'Are you sure to need to logout',
      //                 middleTextStyle: const TextStyle(
      //                   fontSize: 18.0,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //                 backgroundColor: Colors.grey,
      //                 radius: 10.0,
      //                 textCancel: 'No',
      //                 cancelTextColor: Colors.white,
      //                 textConfirm: 'Yes',
      //                 confirmTextColor: Colors.white,
      //                 onCancel: () {
      //                   Get.back();
      //                 },
      //                 onConfirm: () {
      //                   controller.signOutFromApp();
      //                 },
      //                 buttonColor: Get.isDarkMode ? pinkClr : mainColor,
      //               );
      //             },
      //             child: Text(
      //               'Logout',
      //               style: TextStyle(
      //                 color: Get.isDarkMode ? Colors.white : Colors.black,
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
