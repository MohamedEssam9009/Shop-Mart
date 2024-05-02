import 'package:get/get.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;

  String capitalize(String profileName) {
    return profileName.split(' ').map((name) => name.capitalize).join(' ');
  }
}
