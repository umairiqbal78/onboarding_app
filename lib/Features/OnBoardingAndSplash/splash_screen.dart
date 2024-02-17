import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dijelac/Routes/app_pages.dart';
import 'package:dijelac/Utils/Contants/colors.dart';
import 'package:dijelac/Utils/Local_Storage/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var sp = GetStorage();
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      if (XLocalStorage().readData('token') != null) {
      } /*else if (sp.read('initial') == null) {
        sp.write("initial", "true");
        Get.offAllNamed(Routes.loginScreen);
      } */else {
        Get.offAllNamed(Routes.bottomNavBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: XColors.secondaryColor,
        ),
        child: Image.asset(
          "assets/logos/app_logo.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
