import '../../view/screens/category_screen.dart';
import 'package:get/get.dart';

import '../../view/screens/favorites_screen.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ].obs;

  final title = [
    'Asroo Shop',
    'Categories',
    'Favorites',
    'Settings',
  ].obs;
}
