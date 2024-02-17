import 'package:dijelac/Features/BottomNavBar/Controller/bottomNavController.dart';
import 'package:dijelac/Features/Chats/inbox_screen.dart';
import 'package:dijelac/Features/Home/home_screen.dart';
import 'package:dijelac/Features/LentRequests/lent_screen.dart';
import 'package:dijelac/Features/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavBodyWidget extends StatelessWidget {
   CustomBottomNavBodyWidget({super.key});
  BottomNavBarController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(
      builder: (controller) {
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: const <Widget>[
            Center(
              child: HomeScreen(),
            ),
            Center(
              child: LentRequestsScreen(),
            ),
            Center(
              child: InboxScreen(),
            ),
            Center(
              child: ProfileScreen(),
            ),
          ],
        );
      }
    );
  }
}
