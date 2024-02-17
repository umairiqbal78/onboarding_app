import 'package:dijelac/Features/BottomNavBar/Components/language_bottom_bar_item.dart';
import 'package:dijelac/Features/BottomNavBar/Controller/bottomNavController.dart';
import 'package:dijelac/Localization/keys.dart';
import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarWidget extends StatelessWidget {
   CustomBottomAppBarWidget({super.key});
  BottomNavBarController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<BottomNavBarController>(
        builder: (controller) {
          return BottomAppBar(
          height: XHelperFunctions.screenHeight() * 0.08,
          padding: EdgeInsets.zero,
          color: XColors.secondaryColor,
          surfaceTintColor: XColors.primaryColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5.0,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: XColors.secondaryColor,
            currentIndex: controller.selectedIndex,
            selectedItemColor: XColors.primaryColor,
            unselectedItemColor: XColors.textColor,
            onTap: (index) {
              controller.selectedIndex = index;
              controller.pageController.jumpToPage(index);
              controller.update();
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.arrow_drop_down_circle_outlined),
                activeIcon: Icon(Icons.arrow_drop_down_circle_rounded),
                label: 'Requests',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined),
                activeIcon: Icon(Icons.chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon:const Icon(Icons.account_circle_outlined),
                activeIcon:const Icon(Icons.account_circle_sharp),
                label: LocalizationsKeys.myProfile.translate(context),
              ),
            ],
          ),
        );
      }
    );
  }
}
