import '../../logic/controllers/cart_controller.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/main_controller.dart';
import '../../routes/routes.dart';
import '../../utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final controller = Get.put(MainController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            appBar: AppBar(
              elevation: 0.0,
              leading: Container(),
              actions: [
                Obx(
                  () => badges.Badge(
                      position: badges.BadgePosition.topEnd(top: 0, end: 3),
                      badgeAnimation: const badges.BadgeAnimation.slide(),
                      badgeContent: Text(cartController.quantity().toString()),
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.cartScreen);
                        },
                        icon: Image.asset('assets/images/shop.png'),
                      ),
                    ),
                ),
              ],
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: Text(
                controller.title[controller.currentIndex.value],
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ),
          );
        },
      ),
    );
  }
}
