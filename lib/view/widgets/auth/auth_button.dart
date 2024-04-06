import '../../../utils/theme.dart';
import '../text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
        text: text,
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        underline: TextDecoration.none,
      ),
    );
  }
}
