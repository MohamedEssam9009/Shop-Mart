import 'package:asroo_shop/utils/my_string.dart';
import 'package:asroo_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: languageSettings,
                ),
                child: const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20.0),
              TextUtils(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                text: 'Language',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
            ],
          ),
        ),
        Container(
          width: 120.0,
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            border: Border.all(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              width: 2.0,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 25.0,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              items: [
                DropdownMenuItem(
                  value: ene,
                  child: Text(
                    english,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: ara,
                  child: Text(
                    arabic,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: frf,
                  child: Text(
                    french,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                ene = value!;
              },
              value: ene,
            ),
          ),
        ),
      ],
    );
  }
}
