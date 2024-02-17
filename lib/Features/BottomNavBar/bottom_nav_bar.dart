import 'package:dijelac/Features/BottomNavBar/Components/custom_bottom_app_bar_widget.dart';
import 'package:dijelac/Features/BottomNavBar/Components/custom_bottom_navigation_app_bar.dart';
import 'package:dijelac/Features/BottomNavBar/Components/cutom_bottom_nav_body_widget.dart';
import 'package:dijelac/Features/BottomNavBar/Controller/bottomNavController.dart';
import 'package:dijelac/Features/Drawer/Screen/drawer_screen.dart';
import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  BottomNavBarController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (controller) {
      return SafeArea(
        child: AdvancedDrawer(
          backdrop: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [XColors.primaryColor, XColors.primaryColor,XColors.primaryColor.withOpacity(0.6)],
              ),
            ),
          ),
          controller: controller.advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          openScale: 0.9,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          drawer: const XCustomDrawer(),
          child: Scaffold(
            extendBody: true,
            appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(XHelperFunctions.screenHeight() * 0.07),
                child: CustomBottomNavBarAppBarScreen()),
            body: CustomBottomNavBodyWidget(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: XColors.primaryColor,
              shape: const CircleBorder(),
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: XColors.whiteColor,
                size: 28,
              ),
            ),
            bottomNavigationBar:CustomBottomAppBarWidget()
          ),
        ),
      );
    });
  }
}
