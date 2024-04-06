import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                controller.checkBox();
              },
              child: Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: controller.isCheckedBox
                    ? Get.isDarkMode
                        ? Image.asset('assets/images/check.png')
                        : const Icon(
                            Icons.done,
                            color: pinkClr,
                          )
                    : Container(),
              ),
            ),
            const SizedBox(width: 10.0),
            Row(
              children: [
                TextUtils(
                  text: 'I accept ',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  underline: TextDecoration.none,
                ),
                TextUtils(
                  text: 'terms & conditions',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  underline: TextDecoration.underline,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
