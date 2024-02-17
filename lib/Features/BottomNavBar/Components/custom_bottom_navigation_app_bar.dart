import 'package:dijelac/Common/Widgets/custom_app_bar.dart';
import 'package:dijelac/Common/Widgets/language_change.dart';
import 'package:dijelac/Features/BottomNavBar/Controller/bottomNavController.dart';
import 'package:dijelac/Localization/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class CustomBottomNavBarAppBarScreen extends StatelessWidget {
  CustomBottomNavBarAppBarScreen({super.key});
  BottomNavBarController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: false,
      leadingWidget: IconButton(
        onPressed: controller.handleMenuButtonPressed,
        icon: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: controller.advancedDrawerController,
          builder: (_, value, __) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Icon(
                value.visible ? Icons.clear : Icons.menu,
                key: ValueKey<bool>(value.visible),
              ),
            );
          },
        ),
      ),
      title: "Home",
      trailingWidget: GestureDetector(onTap: ()async{
        await controller.onLanguagePressed();
      },
        child: LanguageChangeWidget(
          assetScale: 1.2,
          avatarRadius: 14,
          label: LocalizationsKeys.language.translate(context),
        ),
      ),
    );
  }
}
