import 'package:dijelac/Localization/languages.dart';
import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Device/device.dart';
import 'package:dijelac/Utils/Network/API.dart';
import 'package:dijelac/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Utils/Local_Storage/local_storage.dart';

class BottomNavBarController extends GetxController {
  @override
  onInit() {
    XDeviceUtils.setStatusBarColor(XColors.textColor);
  }
  final advancedDrawerController = AdvancedDrawerController();

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  final PageController pageController = PageController(initialPage: 0);
  late int selectedIndex = 0;
  Future<void> onLanguagePressed() async {
    final previousLocale = XLocalStorage().readData("locale");
    await changeLanguage(
      value: Languages.en.name == previousLocale
          ? Languages.fr.name
          : Languages.en.name,
    );
  }

  Future<void> changeLanguage({required String value}) async {
   await XLocalStorage().writeData<String>("locale", value);
    RestartWidget.restartApp(Get.context!);
  }
}
